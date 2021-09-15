window.addEventListener("load", () => {
    const links = document.querySelectorAll("a[data-remote]");
    links.forEach((element) => {
        element.addEventListener("ajax:success", (event) => {
            const [data, status, xhr] = event.detail
            let id = "cantidad-producto-" + data.id.toString()
            let span = document.getElementById(id)
            span.innerHTML = data.cantidad
        });
    });
}); 