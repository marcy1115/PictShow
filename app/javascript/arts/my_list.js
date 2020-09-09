window.addEventListener('load', function(){
  const pullDownUser = document.getElementById('user-list');
  const pullDownLists = document.getElementById('pull-down-lists'); 
  pullDownUser.addEventListener('mouseover', function(){
    this.setAttribute('style', 'background-color: rgb(184, 129, 206);');
  });

  pullDownUser.addEventListener('click', function(){
    if (pullDownLists.getAttribute('style') == 'display: block;') {
      pullDownLists.removeAttribute('style', 'display: block;');
    }
    else {
      pullDownLists.setAttribute('style', 'display: block;');
    }
  });

  pullDownUser.addEventListener('mouseout', function(){
    this.setAttribute('style', 'background-color: transparent;');
  });
});
