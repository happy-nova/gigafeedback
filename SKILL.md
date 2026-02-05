---
name: gigafeedback
description: Format and send Gigaverse daily feedback reports to Slack using Block Kit. Use when asked to send feedback, format a daily report, or post to the Gigaverse Slack webhook. Triggers on "daily feedback", "send to slack", "format feedback", or "gigafeedback".
---

# Gigafeedback

Format Gigaverse community feedback into rich Slack Block Kit messages with colored sidebars, Linear issue links, and status emojis.

## Configuration

Set the webhook URL as an environment variable:
```bash
export GIGAFEEDBACK_WEBHOOK="https://hooks.slack.com/services/YOUR/WEBHOOK/URL"
```

Or pass directly to the script:
```bash
GIGAFEEDBACK_WEBHOOK="..." scripts/send-feedback.sh < payload.json
```

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

## Usage

1. Receive raw feedback text with bugs, suggestions, pain points, and vibes
2. Parse into sections
3. Format each item with proper mrkdwn, links, and status emojis
4. Build Block Kit JSON with colored attachments
5. POST to webhook

## Example Invocation

```bash
# Send formatted feedback
scripts/send-feedback.sh < payload.json
```

Or construct the JSON directly and curl to the webhook.
