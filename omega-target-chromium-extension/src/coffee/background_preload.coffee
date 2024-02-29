globalThis.window = globalThis
globalThis.global = globalThis
window.UglifyJS_NoUnsafeEval = true

window.OmegaContextMenuQuickSwitchHandler = -> null

chrome.runtime.onInstalled.addListener( ->
  if chrome.contextMenus?
    # We don't need this API. However its presence indicates that Chrome >= 35
    # which provides info.checked we need in contextMenu callback.
    # https://developer.chrome.com/extensions/contextMenus
    if chrome.i18n.getUILanguage?
      chrome.contextMenus.create({
        id: 'enableQuickSwitch'
        title: chrome.i18n.getMessage('contextMenu_enableQuickSwitch')
        type: 'checkbox'
        checked: false
        contexts: ["action"]
      })
    chrome.contextMenus.onClicked.addListener((info, tab) ->
      switch info.menuItemId
        when 'enableQuickSwitch'
          globalThis.OmegaContextMenuQuickSwitchHandler(info)
    )
)
