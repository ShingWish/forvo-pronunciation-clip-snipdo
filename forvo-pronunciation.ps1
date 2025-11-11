param(
[string]$PLAIN_TEXT
)

# ===== 可自訂參數 =====
# 頁面語言 (Page Language): zh, en, ja, ko, fr, de, es, pt, ru, etc.
$PAGE_LANG = "zh"

# 發音語言 (Pronunciation Language): de, en, fr, es, ja, zh, ko, ru, it, pt, etc.
# 常用語言代碼：
#   de = 德語 (German)
#   en = 英語 (English)
#   fr = 法語 (French)
#   es = 西班牙語 (Spanish)
#   ja = 日語 (Japanese)
#   zh = 中文 (Chinese)
#   ko = 韓語 (Korean)
#   ru = 俄語 (Russian)
#   it = 義大利語 (Italian)
#   pt = 葡萄牙語 (Portuguese)
$PRONUNCIATION_LANG = "de"
# ====================

# Convert the word to lowercase for the URL
$word_lower = $PLAIN_TEXT.ToLower().Trim()

# Construct the Forvo URL
$forvo_url = "https://$PAGE_LANG.forvo.com/word/$word_lower/#$PRONUNCIATION_LANG"

# Open the URL in default browser
Start-Process $forvo_url

# Copy the URL to clipboard
Set-Clipboard -Value $forvo_url
