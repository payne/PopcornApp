angular.module('popcornApp.resources', ['rails'])
.factory('Movie', 
   function (railsResourceFactory, $q) {
       var resource = railsResourceFactory({ 
           url: '/movies', 
           name: 'movie'});
       resource.findOrCreateByYoutubeId = function(youtubeId) {
           var d = $q.defer();
           resource.query({youtube_id: youtubeId})
               .then(function(movies) {
                   if(movies.length > 0) {
                       d.resolve(movies[0]); // we have the movie, return it
                   } else {
                       var movie = new resource({youtube_id: youtubeId});
                       movie.save().then(function() {
                           d.resolve(movie);
                       });
                   }
               });
           return d.promise;
       };

       return resource;
   })