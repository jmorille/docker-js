# Build Image  
sudo docker build -t jmorille/npmregistry-public .
 

# View Image
sudo docker run -i -t jmorille/npmregistry-public /bin/bash

# Init
sudo docker run -i -t -p 5984:5984 \
    -v /couchdb/data:/usr/local/var/lib/couchdb \
    -v /couchdb/log:/usr/local/var/log/couchdb jmorille/npmregistry-public \
    /opt/couchapp-init.sh

# Rum Image
sudo docker run -i -t -p 5984:5984 \
    -v /couchdb/data:/usr/local/var/lib/couchdb \
    -v /couchdb/log:/usr/local/var/log/couchdb jmorille/npmregistry-public


# Pour lancer la synchro
# Lien Git https://skimdb.npmjs.com/registry
# Targz
curl -X POST http://admin:admin@127.0.0.1:5984/_replicate  \
  -d '{"source":"https://fullfatdb.npmjs.com/registry", "target":"registry", "create_target":true, "continuous":true, "proxy":"http://172.30.3.11:3128"}' -H "Content-Type: application/json"

# Monitoring Synchro
http://admin:admin@127.0.0.1:5984/_active_tasks
http://admin:admin@gf219896.groupe.generali.fr:5984/registry/_changes
 
 
npm config set registry=http://gf219896.groupe.generali.fr:5984/registry/_design/app/_rewrite


# CouchDB Sync Error
# #######################

[error] [emulator] Error in process <0.23858.9> with exit value: {{nocatch,{missing_stub,<<38 bytes>>}},[{couch_replicator_api_wrap,run_user_fun,4},{couch_replicator_api_wrap,receive_docs,4},{couch_replicator_api_wrap,receive_docs_loop,6},{couch_replicator_api_wrap,'-open_doc_revs/6-fun-4-'... 

=ERROR REPORT==== 20-May-2014::11:38:34 ===
Error in process <0.23858.9> with exit value: {{nocatch,{missing_stub,<<38 bytes>>}},[{couch_replicator_api_wrap,run_user_fun,4},{couch_replicator_api_wrap,receive_docs,4},{couch_replicator_api_wrap,receive_docs_loop,6},{couch_replicator_api_wrap,'-open_doc_revs/6-fun-4-'... 

[error] [<0.23857.9>] Retrying fetch and update of document `riemannjs` due to out of sync attachment stubs. Missing revisions are: 5-208115b2a315af1baad0c1a2aa9cffd4




Source : https://fullfatdb.npmjs.com/_utils/document.html?registry/riemannjs

riemannjs
_rev  6-77ff4e8452f220088ad5e8bdc23d9715
_attachments
  * riemannjs-0.0.0.tgz   (5.1 KB, application/octet-stream)
  * riemannjs-0.0.1.tgz   (5.3 KB, application/octet-stream)
  * riemannjs-0.1.0.tgz   (5.3 KB, application/octet-stream)


Generali : http://gf219896.groupe.generali.fr:5984/_utils/document.html?registry/riemannjs
riemannjs
_rev             4-123466e068ef23c8d3a9c04393f853a1
_attachments  :
   * riemannjs-0.0.0.tgz (5.1 KB, application/octet-stream)
   * riemannjs-0.0.1.tgz (5.3 KB, application/octet-stream)




###############################

Open Issues
https://github.com/couchbase/sync_gateway/issues/50
https://github.com/npm/npmregistry-public/issues/166