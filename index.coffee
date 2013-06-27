gitteh = require 'gitteh'
{defer} = require 'kew'

promisify = (func) ->
  (args...) ->
    promise = defer()
    args.push (err, result) ->
      if err then promise.reject(err) else promise.resolve(result)
    func.call(this, args...)
    promise

gitteh.promiseOpenRepository = promisify gitteh.openRepository
gitteh.promiseInitRepository = promisify gitteh.initRepository
gitteh.Blob::promiseSave = promisify gitteh.Blob::save
gitteh.Commit::promiseSave = promisify gitteh.Commit::save
gitteh.Commit::promiseTree = promisify gitteh.Commit::tree
gitteh.Index::promiseAddEntry = promisify gitteh.Index::addEntry
gitteh.Index::promiseFindEntry = promisify gitteh.Index::findEntry
gitteh.Index::promiseGetEntry = promisify gitteh.Index::getEntry
gitteh.Index::promiseWrite = promisify gitteh.Index::write
gitteh.Reference::promiseDelete = promisify gitteh.Reference::delete
gitteh.Reference::promiseResolve = promisify gitteh.Reference::resolve
gitteh.Reference::promiseRename = promisify gitteh.Reference::rename
gitteh.Reference::promiseSetTarget = promisify gitteh.Reference::setTarget
gitteh.Repository::promiseReference = promisify gitteh.Repository::reference
gitteh.Repository::promiseCommit = promisify gitteh.Repository::commit
gitteh.Repository::promiseBlob = promisify gitteh.Repository::blob
gitteh.Repository::promiseTree = promisify gitteh.Repository::tree
gitteh.Repository::promiseCreateBlob = promisify gitteh.Repository::createBlob
gitteh.Repository::promiseCreateCommit = promisify gitteh.Repository::createCommit
gitteh.Repository::promiseCreateTag = promisify gitteh.Repository::createTag
gitteh.Repository::promiseCreateTree = promisify gitteh.Repository::createTree

module.exports = gitteh
