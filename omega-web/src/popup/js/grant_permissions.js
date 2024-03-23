
const btn = document.querySelector('#grant-permissions-btn')
btn.onclick = async ()=>{
  const permissionValue = {origins: ["<all_urls>"]}
  const hasPermission = await browser.permissions.request(permissionValue);
  if (hasPermission) {
    location.href = 'index.html'
  }
}
