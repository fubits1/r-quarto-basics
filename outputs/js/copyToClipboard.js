function copyToClipboard(domRef) {
  // get DOM Element which contains the output
  // i.e. ".cell-output code" to the first output chunk
  const dom = document.querySelector(domRef);
  // get the clean inner string of the DOM Element (no HTML)
  const innerText = dom.innerText;
  // with RegEx, remove [nr] and "
  const cleanString = innerText.replace(/\[\d+]\s/, '').replace(/"/g, "")
  // write to clipboard
  navigator.clipboard.writeText(cleanString);
}
