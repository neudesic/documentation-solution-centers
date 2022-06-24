document$.subscribe(() => {
    var contentSection = document.getElementsByClassName("md-content");
    if (contentSection.length > 0) {
        var images = contentSection[0].getElementsByTagName("img");
        for (var i = images.length - 1; i >= 0; i--) {
            // Video Link
            if (images[i].getAttribute('videosrc')) {
                var href = images[i].getAttribute('videosrc');
                var wrapper = document.createElement('a');
                wrapper.setAttribute('href', href);
                wrapper.onclick = (e) => {
                    e.preventDefault();
                    var url = e.target.getAttribute('videosrc');
                    var alt = e.target.getAttribute('alt');
                    popupCenter({ url: url, title: alt, w: 600, h: 400 })
                    return false;
                };
                images[i].parentNode.insertBefore(wrapper, images[i]);
                wrapper.appendChild(images[i]);
            }
            // Image
            else {
                var dataTitle = images[i].getAttribute('alt');
                var dataLightBox = 'image-' + i;
                var href = images[i].getAttribute('src');
                var wrapper = document.createElement('a');
                wrapper.setAttribute('data-title', dataTitle);
                wrapper.setAttribute('data-lightbox', dataLightBox);
                wrapper.setAttribute('href', href);
                images[i].parentNode.insertBefore(wrapper, images[i]);
                wrapper.appendChild(images[i]);
            }
        }
    }
})

const popupCenter = ({ url, title, w, h }) => {
    // Fixes dual-screen position                             Most browsers      Firefox
    const dualScreenLeft = window.screenLeft !== undefined ? window.screenLeft : window.screenX;
    const dualScreenTop = window.screenTop !== undefined ? window.screenTop : window.screenY;

    const width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    const height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    const systemZoom = width / window.screen.availWidth;
    const left = (width - w) / 2 / systemZoom + dualScreenLeft
    const top = (height - h) / 2 / systemZoom + dualScreenTop
    const newWindow = window.open(url, title,
        `
      scrollbars=yes,
      width=${w / systemZoom}, 
      height=${h / systemZoom}, 
      top=${top}, 
      left=${left}
      `
    )

    if (window.focus) newWindow.focus();
}