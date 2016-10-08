ad_library {

    Intranet FS Callbacks

    @author  (kolibri@ubuntu.localdomain)
    @creation-date 2011-10-07
    @cvs-id $Id$
}

ad_proc -public -callback fs::folder_delete -impl project_fs {
    {-package_id:required}
    {-folder_id:required}
} {
    Delete the folders connections
} {   
    # Delete relationships
    
    set rel_ids [db_list acs_rels "select rel_id from acs_rels where object_id_one = :folder_id or object_id_two = :folder_id"]
    foreach rel_id $rel_ids {
	relation_remove $rel_id
    }
}

