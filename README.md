# Gigafeedback

An [OpenClaw](https://github.com/openclaw/openclaw) skill for formatting automated daily feedback reports for [Gigaverse](https://gigaverse.io).

## What it does

Transforms raw community feedback (bugs, suggestions, pain points, vibes) into richly formatted Slack Block Kit messages with:

- 🎨 Colored sidebars by section type
- 🔗 Clickable Linear issue links
- 📊 Status emojis (Upcoming, In Progress, Done, etc.)
- 📝 Consistent formatting for easy scanning

## Installation

Clone into your OpenClaw skills directory:

```bash
git clone https://github.com/happy-nova/gigafeedback.git ~/.openclaw/skills/gigafeedback
```

Or add as a submodule:

```bash
git submodule add https://github.com/happy-nova/gigafeedback.git skills/gigafeedback
```

## Usage

Ask your agent to format feedback using this skill:

> "Format this daily feedback for Slack: [paste feedback]"

> "Send this to the Gigaverse Slack channel: [paste feedback]"

The skill provides formatting guidance — send the output however you like (webhook, API, copy/paste).

## Example Output

![Slack preview](https://via.placeholder.com/600x400?text=Slack+Block+Kit+Preview)

- **Red sidebar** → Bugs
- **Blue sidebar** → Suggestions
- **Yellow sidebar** → Pain Points
- **Green sidebar** → Community Vibes

## License

MIT
