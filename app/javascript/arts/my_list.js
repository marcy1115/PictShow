window.addEventListener('load', function(){
  const pullDownUser = document.getElementById('user-list');
  const pullDownLists = document.getElementById('pull-down-lists'); 
  pullDownUser.addEventListener('mouseover', function(){
    pullDownUser.setAttribute('style', 'background-color: rgb(184, 129, 206);');
  });

  pullDownUser.addEventListener('click', function(){
    pullDownLists.setAttribute('style', 'display: block;');
  });

  pullDownUser.addEventListener('mouseout', function(){
    pullDownUser.setAttribute('style', 'background-color: transparent;');
  });

});
