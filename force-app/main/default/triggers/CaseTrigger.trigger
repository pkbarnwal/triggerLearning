trigger CaseTrigger on Case (before insert, after insert, before update, after update,before delete, after delete, after undelete) {
 System.debug('-----Trigger Context Variable');
          System.debug('isExecuting: ' +Trigger.isExecuting);
          System.debug('isInsert: '    + Trigger.isInsert);
          System.debug('isUpdate: '    + Trigger.isUpdate);
          System.debug('isDelete: '    + Trigger.isDelete);
          System.debug('isBefore: '    + Trigger.isBefore);
          System.debug('isAfter: '     + Trigger.isAfter);
          System.debug('isUndelete: '  + Trigger.isUndelete);
                                 
          System.debug('new: '         + Trigger.new);
          System.debug('newMap: '      + Trigger.newMap);
          System.debug('old: '         + Trigger.old);
          System.debug('oldMap: '         + Trigger.oldMap);
          System.debug('size: '        + Trigger.size);
          System.debug('--- Trigger Context Variables End ---');          
 }