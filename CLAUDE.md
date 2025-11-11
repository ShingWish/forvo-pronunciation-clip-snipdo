# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **SnipDo PowerShell extension** for NextAI Translator. SnipDo is a clipboard/snippet management tool that allows custom extensions via `.pbar` files (zip archives containing PowerShell scripts and metadata).

## Architecture

The extension consists of three core components:

1. **nextai-translator.json** - Extension manifest that defines the extension metadata and action configuration for SnipDo
2. **nextai-translator.ps1** - PowerShell script that handles the translation logic
3. **icon.png** - Visual asset for the extension UI

### How It Works

When triggered in SnipDo:
1. User selects text (passed as `$PLAIN_TEXT` parameter to the PowerShell script)
2. Script encodes the text as UTF-8 bytes
3. Script sends POST request to `127.0.0.1:62007` (local NextAI Translator service)
4. The local service processes the translation request

The extension expects a **NextAI Translator service to be running locally on port 62007**.

## Building and Packaging

To create/rebuild the `.pbar` file:

```powershell
# Package the extension (from the directory containing the files)
Compress-Archive -Path icon.png,nextai-translator.json,nextai-translator.ps1 -DestinationPath nextai-translator.pbar -Force
```

To extract and inspect the package:

```powershell
unzip -l nextai-translator.pbar
unzip -q nextai-translator.pbar
```

## Testing

To test the PowerShell script directly:

```powershell
.\nextai-translator.ps1 -PLAIN_TEXT "Hello World"
```

**Prerequisites**: NextAI Translator service must be running on `127.0.0.1:62007`

## File Structure

- `nextai-translator.pbar` - Packaged extension (zip archive)
- `nextai-translator.json` - Extension manifest
- `nextai-translator.ps1` - PowerShell action script
- `icon.png` - Extension icon (140KB PNG)

## Key Technical Details

- The PowerShell script uses `curl` (Invoke-WebRequest alias) with `-UseBasicParsing` flag
- Text is explicitly UTF-8 encoded before transmission
- Extension identifier: `xyz.yetone.apps.openai-translator.clip-extensions.snipdo`
- Communication protocol: HTTP POST with raw byte body
