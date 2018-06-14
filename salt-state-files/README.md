
#Salt states can be triggered on minions

#Syntax:

   salt '<target-minion>' state.apply <name-of-state>


#Example:
  
   salt 'minion-1' state.apply copy-file


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#SaltStack - Configure an event driven Infrastructure

#Example:

To push default configurations to salt-minions whenever salt-minion service gets restarted i.e. when a machine restarts or slat-minion service is manually restarted !


#Configuring event driven infrastructure using Salt Reactor
 

#1. Create a reactor.conf file in path: /etc/salt/master.d/reactor.conf
 

#Syntax:
 
reactor:
  - 'salt/minion/*/start':
    - /srv/reactor/cp-default-conf.sls
 

The directory /srv/salt/ will contain all Salt State files and the directory /srv/reactor contain all Reactor files.


#2. Create a cp-default-conf.sls file in path: /srv/reactor/cp-default-conf.sls
 

#Syntax:
 
cp_default_conf_run:
  local.state.sls:
    - tgt: "*"
    - kwarg:
        mods:
          cp-default-conf
        test: False


#3. Create a init.sls file in path: /srv/salt/cp-default-conf/init.sls
 

#Syntax:
 
/path/default/config/saved/on/minions:
  file.recurse:
    - source: /path/config/files/available/
    - user: root
    - group: root
  cmd.run:
    - name: service <service/name> restart


Finally restart the salt-master service to make you changes refelected.

#Syntax:
 
     service salt-master restart




-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#SaltStack NodeGroups


NodeGroup can be creted ad salt-minion can we added to group the machines 


Create NodeGroups in /etc/salt/master 

Example Groups:  

      Group-1
      Group-2
      Group-3

Note: As new machine/salt-minion get created need to manually add them to groups


