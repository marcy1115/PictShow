function comment(){
  const submit = document.getElementById('submit');

  submit.addEventListener('click', (e) => {
    const formData = new FormData(document.getElementById('form'));
    const XHR      = new XMLHttpRequest();

    XHR.open('GET', 'art_path', true);
    XHR.responseType = 'json';
    XHR.send(formData);
    debugger
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const item     = XHR.response.post;
      const list     = document.getElementById('list');
      const formText = document.getElementById('comment-text');
      const HTML = `
      <div>
        ${item}
      </div>`;
    list.insertAdjacentHTML('afterend', HTML);
    formData.value = '';
    };
  });
};

window.addEventListener('load', comment);