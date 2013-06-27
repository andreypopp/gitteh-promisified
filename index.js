// Generated by CoffeeScript 1.6.3
var defer, gitteh, promisify,
  __slice = [].slice;

gitteh = require('gitteh');

defer = require('kew').defer;

promisify = function(func) {
  return function() {
    var args, promise;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    promise = defer();
    args.push(function(err, result) {
      if (err) {
        return promise.reject(err);
      } else {
        return promise.resolve(result);
      }
    });
    func.call.apply(func, [this].concat(__slice.call(args)));
    return promise;
  };
};

gitteh.promiseOpenRepository = promisify(gitteh.openRepository);

gitteh.promiseInitRepository = promisify(gitteh.initRepository);

gitteh.Blob.prototype.promiseSave = promisify(gitteh.Blob.prototype.save);

gitteh.Commit.prototype.promiseSave = promisify(gitteh.Commit.prototype.save);

gitteh.Commit.prototype.promiseTree = promisify(gitteh.Commit.prototype.tree);

gitteh.Index.prototype.promiseAddEntry = promisify(gitteh.Index.prototype.addEntry);

gitteh.Index.prototype.promiseFindEntry = promisify(gitteh.Index.prototype.findEntry);

gitteh.Index.prototype.promiseGetEntry = promisify(gitteh.Index.prototype.getEntry);

gitteh.Index.prototype.promiseWrite = promisify(gitteh.Index.prototype.write);

gitteh.Reference.prototype.promiseDelete = promisify(gitteh.Reference.prototype["delete"]);

gitteh.Reference.prototype.promiseResolve = promisify(gitteh.Reference.prototype.resolve);

gitteh.Reference.prototype.promiseRename = promisify(gitteh.Reference.prototype.rename);

gitteh.Reference.prototype.promiseSetTarget = promisify(gitteh.Reference.prototype.setTarget);

gitteh.Repository.prototype.promiseReference = promisify(gitteh.Repository.prototype.reference);

gitteh.Repository.prototype.promiseCommit = promisify(gitteh.Repository.prototype.commit);

gitteh.Repository.prototype.promiseBlob = promisify(gitteh.Repository.prototype.blob);

gitteh.Repository.prototype.promiseTree = promisify(gitteh.Repository.prototype.tree);

gitteh.Repository.prototype.promiseCreateBlob = promisify(gitteh.Repository.prototype.createBlob);

gitteh.Repository.prototype.promiseCreateCommit = promisify(gitteh.Repository.prototype.createCommit);

gitteh.Repository.prototype.promiseCreateTag = promisify(gitteh.Repository.prototype.createTag);

gitteh.Repository.prototype.promiseCreateTree = promisify(gitteh.Repository.prototype.createTree);

module.exports = gitteh;
