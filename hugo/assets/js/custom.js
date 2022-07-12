// Enable CSS classes based on whether JS loads
document.documentElement.classList.remove('no-js')

// Reading params from query strings
function queryParams() {
  const params = new URLSearchParams(window.location.search)
  let url = params.get('url')
  let display = elem('.dead-link .url')
  let archive = elem('.archive-link .internet-archive')
  display.textContent = url
  archive.href = 'https://web.archive.org/web/*/' + url
}

queryParams()

// Overriding subheading permalinks in Hugo Clarity
// cf. https://github.com/chipzoller/hugo-clarity/blob/f062754faf7b5e92fa9dfc249b370022cc72738a/assets/js/index.js#L105-L115
function headingPermalink() {
  const baseURL = '{{ .Site.BaseURL }}'

  let headingNodes = [],
    results,
    link,
    icon,
    current,
    id,
    tags = ['h2', 'h3', 'h4', 'h5', 'h6']

  current = document.URL

  tags.forEach(function (tag) {
    const article = elem('.post_content')
    if (article) {
      results = article.getElementsByTagName(tag)
      Array.prototype.push.apply(headingNodes, results)
    }
  })

  headingNodes.forEach(function (node) {
    // Remove HC-created links
    node.removeChild(node.firstElementChild)

    // Create new links
    link = createEl('a')
    link.className = 'link icon'

    // Create child span
    let span = createEl('span')
    link.appendChild(span)
    span.className = 'permalink'
    span.textContent = 'Permalink'

    // Append URL fragment
    id = node.getAttribute('id')
    if (id) {
      link.href = `${current}#${id}`
      node.appendChild(link)
      pushClass(node, 'link_owner')
    }
  })
}

headingPermalink()
