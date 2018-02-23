CREATE OR REPLACE TRIGGER tr_devinfo_insert 
 AFTER INSERT ON imm_devinfo 
 FOR EACH ROW 
 update identifier_info set devUsed=1 where id=new.devId#


CREATE OR REPLACE TRIGGER tr_devinfo_update
 AFTER UPDATE ON imm_devinfo 
 FOR EACH ROW BEGIN
 UPDATE identifier_info SET devUsed=0 WHERE id = old.devId;
 UPDATE identifier_info SET devUsed=1 WHERE id =new.devId;
 END#


CREATE OR REPLACE TRIGGER tr_devinfo_delete 
BEFORE DELETE ON imm_devinfo 
FOR EACH ROW 
update identifier_info set devUsed=0 where id=old.devId#


CREATE OR REPLACE TRIGGER tri_imm_sub_sys_ins 
AFTER INSERT ON imm_sub_sys_of_alarm_host 
FOR EACH ROW 
begin 
insert into mcs_devstatus value(new.devId,new.subSysId,(select ownerId from imm_devinfo where devId =new.devId),0,now());
end#

CREATE OR REPLACE TRIGGER tri_imm_sub_sys_dele 
AFTER DELETE ON imm_sub_sys_of_alarm_host 
FOR EACH ROW begin 
delete from mcs_devstatus where devId = OLD.devId and subSysId = OLD.subSysId;
end#


CREATE OR REPLACE TRIGGER t_afterinsert_on_userinfo 
AFTER INSERT ON imm_userinfo 
FOR EACH ROW 
BEGIN 
UPDATE identifier_info SET userUsed = 1 WHERE id = NEW.userId;
END #


CREATE OR REPLACE TRIGGER tr_userinfo_update 
AFTER UPDATE ON imm_userinfo 
FOR EACH ROW BEGIN
 UPDATE identifier_info SET userUsed=0 WHERE id = old.userId;
 UPDATE identifier_info SET userUsed=1 WHERE id =new.userId;
 END#

CREATE OR REPLACE TRIGGER t_afterdelete_on_userinfo 
AFTER DELETE ON imm_userinfo 
FOR EACH ROW BEGIN
     UPDATE identifier_info SET userUsed = 0 WHERE id = OLD.userId;
END#
