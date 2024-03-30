(function() {
  async function updateStyle(){
    OmegaTargetPopup.getState(['customCss'], function(err, state) {
      const { customCss } = state;
      document.querySelectorAll('.om-style').forEach((el)=>el.remove())
      const styleEl = document.createElement('style')
      styleEl.classList.add('om-style')
      if (customCss) {
        document.head.append(styleEl)
        styleEl.innerHTML = customCss
      }
    })
  }
  updateStyle();
})();
