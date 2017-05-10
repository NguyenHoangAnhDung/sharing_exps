'use strict';

angular.module('myPageApp')
  .controller('postCtrl', postCtrl);

function postCtrl(){
  var postCtrl = this;

  postCtrl.test = function(){
    console.log('ready');
  }
}
