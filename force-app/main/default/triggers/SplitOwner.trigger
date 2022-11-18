trigger SplitOwner on Account (before insert) {
    if (Trigger.isBefore && Trigger.isInsert){
       AccountHandler.changeOwner(Trigger.new);
    }
}