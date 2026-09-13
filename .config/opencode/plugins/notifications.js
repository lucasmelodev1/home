const sessionTitle = async (client, sessionID) => {
  if (!sessionID) return "OpenCode"

  try {
    const result = await client.session.get({ path: { id: sessionID } })
    return result.data?.title || "OpenCode"
  } catch {
    return "OpenCode"
  }
}

const errorMessage = (error) => {
  if (!error) return "Unknown error"
  if (typeof error === "string") return error
  if (typeof error.message === "string") return error.message
  if (typeof error.data?.message === "string") return error.data.message
  return "Unknown error"
}

const sendNotification = async ($, title, description, urgency) => {
  const message = `${title}: ${description}`

  try {
    await $`notify-send --app-name=OpenCode --urgency=${urgency} ${title} ${description}`
  } catch (error) {
    console.error("OpenCode desktop notification failed:", error)
  }

  if (!process.env.TMUX_PANE) return

  try {
    await $`tmux display-message -t ${process.env.TMUX_PANE} ${message}`
  } catch (error) {
    console.error("OpenCode tmux notification failed:", error)
  }
}

export const NotificationPlugin = async ({ client, $ }) => ({
  event: async ({ event }) => {
    let sessionID
    let description
    let urgency = "normal"

    if (event.type === "session.idle") {
      sessionID = event.properties.sessionID
      description = "Session finished"
    } else if (event.type === "session.error") {
      sessionID = event.properties.sessionID
      description = `Error: ${errorMessage(event.properties.error)}`
      urgency = "critical"
    } else if (event.type === "permission.asked") {
      sessionID = event.properties.sessionID
      const patterns = event.properties.patterns?.join(", ")
      description = `Permission requested: ${event.properties.permission}${patterns ? ` (${patterns})` : ""}`
      urgency = "critical"
    } else if (event.type === "permission.updated") {
      sessionID = event.properties.sessionID
      const pattern = Array.isArray(event.properties.pattern)
        ? event.properties.pattern.join(", ")
        : event.properties.pattern
      description = `Permission requested: ${event.properties.title}${pattern ? ` (${pattern})` : ""}`
      urgency = "critical"
    } else {
      return
    }

    const title = await sessionTitle(client, sessionID)
    await sendNotification($, title, description, urgency)
  },
})
