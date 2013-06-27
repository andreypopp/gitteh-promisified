gitteh = require 'gitteh'
{defer} = require 'kew'

promisify = (func) ->
  (args..., cb) ->
    args.push(cb)
    if typeof cb == 'function'
      func.call(this, args...)
    else
      promise = defer()
      args.push (err, result) ->
        if err then promise.reject(err) else promise.resolve(result)
      func.call(this, args...)
      promise

gitteh.openRepository = promisify gitteh.openRepository
gitteh.initRepository = promisify gitteh.initRepository
gitteh.Blob::save = promisify gitteh.Blob::save
gitteh.Commit::save = promisify gitteh.Commit::save
gitteh.Commit::tree = promisify gitteh.Commit::tree
gitteh.Index::addEntry = promisify gitteh.Index::addEntry
gitteh.Index::findEntry = promisify gitteh.Index::findEntry
gitteh.Index::getEntry = promisify gitteh.Index::getEntry
gitteh.Index::write = promisify gitteh.Index::write
gitteh.Reference::delete = promisify gitteh.Reference::delete
gitteh.Reference::resolve = promisify gitteh.Reference::resolve
gitteh.Reference::rename = promisify gitteh.Reference::rename
gitteh.Reference::setTarget = promisify gitteh.Reference::setTarget
gitteh.Repository::reference = promisify gitteh.Repository::reference
gitteh.Repository::commit = promisify gitteh.Repository::commit
gitteh.Repository::blob = promisify gitteh.Repository::blob
gitteh.Repository::tree = promisify gitteh.Repository::tree
gitteh.Repository::createBlob = promisify gitteh.Repository::createBlob
gitteh.Repository::createCommit = promisify gitteh.Repository::createCommit
gitteh.Repository::createTag = promisify gitteh.Repository::createTag
gitteh.Repository::createTree = promisify gitteh.Repository::createTree

module.exports = gitteh
