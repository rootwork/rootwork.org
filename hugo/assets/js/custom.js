// Enable CSS classes based on whether JS loads
document.documentElement.classList.remove('no-js')

// If on dead-link page, show the link based on query params.
const page = window.location.pathname
if (page === '/dead-link/') {
  showDeadLink()
}

// Read params from query strings and set dead-link.
function showDeadLink() {
  const params = new URLSearchParams(window.location.search)
  let url = params.get('url') || ''
  let display = elem('.dead-link .url') || ''
  let archive = elem('.archive-link .internet-archive') || ''
  display.textContent = url
  archive.href = 'https://web.archive.org/web/*/' + url
}

// Overriding subheading permalinks in Hugo Clarity
// cf. https://github.com/chipzoller/hugo-clarity/blob/master/assets/js/index.js#L105-L115
;(function headingPermalink() {
  let headingNodes = [],
    results,
    link,
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
    const oldIcon = node.childNodes[1] || ''

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

    // Replace old icon-link with new one
    if (oldIcon) {
      oldIcon.replaceWith(link)
    }
  })
})()

// Provide copy function for shortlinks
// cf. https://github.com/chipzoller/hugo-clarity/blob/master/assets/js/index.js#L138-L155
function copyShortLink() {
  let cssClass, deeplinks, newLink, parent, target
  cssClass = 'short_link__link'
  deeplinks = elems(`.${cssClass}`)

  if (deeplinks) {
    // let linkTitle = 'short_link__linktitle'
    // elems(`.${linkTitle}`).innerText = "Copy link"
    // elem(`.${linkTitle}::hover,.${linkTitle}::active,.${linkTitle}::focus`).style.display = "block"

    document.addEventListener('click', function (event) {
      target = event.target
      parent = target.parentNode
      if (
        (target && containsClass(target, cssClass)) ||
        containsClass(parent, cssClass)
      ) {
        event.preventDefault()
        // linkTitle.remove();
        newLink =
          target.href != undefined ? target.href : target.parentNode.href
        copyToClipboard(newLink)
        target.href != undefined
          ? copyShortLinkFeedback(target)
          : copyShortLinkFeedback(target.parentNode)
        target.title = ''
      }
    })
  }
}

copyShortLink()

function copyShortLinkFeedback(parent) {
  const copyText = document.createElement('div')
  const yanked = 'link_yanked'
  copyText.classList.add(yanked)
  copyText.innerText = 'Link Copied'
  if (!elem(`.${yanked}`, parent)) {
    parent.appendChild(copyText)
    setTimeout(function () {
      parent.removeChild(copyText)
    }, 3000)
  }
}
