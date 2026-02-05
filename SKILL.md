---
name: gigafeedback
description: Format and send Gigaverse daily feedback reports to Slack using Block Kit. Use when asked to send feedback, format a daily report, or post to the Gigaverse Slack webhook. Triggers on "daily feedback", "send to slack", "format feedback", or "gigafeedback".
---

# Gigafeedback

Format Gigaverse community feedback into rich Slack Block Kit messages with colored sidebars, Linear issue links, and status emojis.

**This skill is primarily format guidance.** You can send the formatted message however you like — curl, Slack API, copy/paste, etc. The webhook helper script is optional.

## Message Structure

```
Header Block: "📊 Daily Feedback — {Date}"
Section Block: Mood summary

Attachment (Red #E74C3C):    🐛 Bugs
Attachment (Blue #3498DB):   💡 Suggestions  
Attachment (Yellow #F39C12): 😤 Pain Points
Attachment (Green #2ECC71):  🎭 Community Vibes
```

## Formatting Rules

### Bug Format
```
• *{Short title}* — {reporter}: "{quote}" (#{channel})
→ <https://linear.app/gigaverse-game/issue/{TICKET}|{TICKET}> {status_emoji} {Status} _{notes}_
```

### Suggestion Format
```
*{score}/10* — *{Short title}* — {reporter} (#{channel})
_{One-line assessment}_
→ <link|TICKET> {status_emoji} {Status}
```

### Pain Point Format
```
• *{Short title}* — {reporter}: "{quote}" (#{channel})
→ {ticket_or_no_ticket} _{notes}_
```

## Status Emojis

| Status | Emoji |
|--------|-------|
| Upcoming | 📋 |
| In Progress | 🔄 |
| In Code Review | 🔍 |
| Done | ✅ |
| Canceled | ❌ |
| No ticket | ⚪ |

## Linear Links

Format all GIGA-XXX references as clickable links:
```
<https://linear.app/gigaverse-game/issue/GIGA-XXX|GIGA-XXX>
```

## Sidebar Colors

| Section | Hex | Purpose |
|---------|-----|---------|
| Bugs | #E74C3C | Red - urgent issues |
| Suggestions | #3498DB | Blue - ideas |
| Pain Points | #F39C12 | Yellow - friction |
| Community Vibes | #2ECC71 | Green - sentiment |

## Sending (Optional)

If using a webhook, set the env var and pipe JSON to the helper:
```bash
export GIGAFEEDBACK_WEBHOOK="https://hooks.slack.com/services/YOUR/WEBHOOK/URL"
scripts/send-feedback.sh < payload.json
```

Or just curl directly:
```bash
curl -X POST -H 'Content-type: application/json' --data @payload.json "$YOUR_WEBHOOK"
```

Or copy the formatted JSON and paste into any Slack Block Kit tool.
