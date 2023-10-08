ALTER TABLE isu_condition ADD INDEX uuid_timestamp_idx (jia_isu_uuid, timestamp DESC);
ALTER TABLE isu_condition ADD INDEX uuid_idx (jia_isu_uuid);
