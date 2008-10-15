CREATE TABLE customer (
  c_id int(11) NOT NULL default '0',
  c_d_id int(11) NOT NULL default '0',
  c_w_id int(11) NOT NULL default '0',
  c_first varchar(16) default NULL,
  c_middle char(2) default NULL,
  c_last varchar(16) default NULL,
  c_street_1 varchar(20) default NULL,
  c_street_2 varchar(20) default NULL,
  c_city varchar(20) default NULL,
  c_state char(2) default NULL,
  c_zip varchar(9) default NULL,
  c_phone varchar(16) default NULL,
  c_since timestamp NOT NULL,
  c_credit char(2) default NULL,
  c_credit_lim decimal(24,12) default NULL,
  c_discount double default NULL,
  c_balance decimal(24,12) default NULL,
  c_ytd_payment decimal(24,12) default NULL,
  c_payment_cnt double default NULL,
  c_delivery_cnt double default NULL,
  c_data text,
  PRIMARY KEY  (c_w_id,c_d_id,c_id)
);

CREATE INDEX c_w_id ON customer (c_w_id,c_d_id,c_last,c_first);

CREATE TABLE district (
  d_id int(11) NOT NULL default '0',
  d_w_id int(11) NOT NULL default '0',
  d_name varchar(10) default NULL,
  d_street_1 varchar(20) default NULL,
  d_street_2 varchar(20) default NULL,
  d_city varchar(20) default NULL,
  d_state char(2) default NULL,
  d_zip varchar(9) default NULL,
  d_tax double default NULL,
  d_ytd decimal(24,12) default NULL,
  d_next_o_id int(11) default NULL,
  PRIMARY KEY  (d_w_id,d_id)
);

CREATE TABLE history (
  h_c_id int(11) default NULL,
  h_c_d_id int(11) default NULL,
  h_c_w_id int(11) default NULL,
  h_d_id int(11) default NULL,
  h_w_id int(11) default NULL,
  h_date timestamp NOT NULL,
  h_amount double default NULL,
  h_data varchar(24) default NULL
);


CREATE TABLE item (
  i_id int(11) NOT NULL default '0',
  i_im_id int(11) default NULL,
  i_name varchar(24) default NULL,
  i_price double default NULL,
  i_data varchar(50) default NULL,
  PRIMARY KEY  (i_id)
);


CREATE TABLE new_order (
  no_o_id int(11) NOT NULL default '0',
  no_d_id int(11) NOT NULL default '0',
  no_w_id int(11) NOT NULL default '0',
  PRIMARY KEY  (no_d_id,no_w_id,no_o_id)
);

CREATE TABLE order_line (
  ol_o_id int(11) NOT NULL default '0',
  ol_d_id int(11) NOT NULL default '0',
  ol_w_id int(11) NOT NULL default '0',
  ol_number int(11) NOT NULL default '0',
  ol_i_id int(11) default NULL,
  ol_supply_w_id int(11) default NULL,
  ol_delivery_d timestamp NOT NULL,
  ol_quantity double default NULL,
  ol_amount double default NULL,
  ol_dist_info varchar(24) default NULL,
  PRIMARY KEY  (ol_w_id,ol_d_id,ol_o_id,ol_number)
);

CREATE TABLE orders (
  o_id int(11) NOT NULL default '0',
  o_d_id int(11) NOT NULL default '0',
  o_w_id int(11) NOT NULL default '0',
  o_c_id int(11) default NULL,
  o_entry_d timestamp NOT NULL,
  o_carrier_id int(11) default NULL,
  o_ol_cnt int(11) default NULL,
  o_all_local double default NULL,
  PRIMARY KEY  (o_w_id,o_d_id,o_id)
);

CREATE INDEX o_w_id ON orders (o_w_id,o_d_id,o_c_id,o_id)

CREATE TABLE stock (
  s_i_id int(11) NOT NULL default '0',
  s_w_id int(11) NOT NULL default '0',
  s_quantity double NOT NULL default '0',
  s_dist_01 varchar(24) default NULL,
  s_dist_02 varchar(24) default NULL,
  s_dist_03 varchar(24) default NULL,
  s_dist_04 varchar(24) default NULL,
  s_dist_05 varchar(24) default NULL,
  s_dist_06 varchar(24) default NULL,
  s_dist_07 varchar(24) default NULL,
  s_dist_08 varchar(24) default NULL,
  s_dist_09 varchar(24) default NULL,
  s_dist_10 varchar(24) default NULL,
  s_ytd decimal(16,8) default NULL,
  s_order_cnt double default NULL,
  s_remote_cnt double default NULL,
  s_data varchar(50) default NULL,
  PRIMARY KEY  (s_w_id,s_i_id)
);

CREATE TABLE warehouse (
  w_id int(11) NOT NULL default '0',
  w_name varchar(10) default NULL,
  w_street_1 varchar(20) default NULL,
  w_street_2 varchar(20) default NULL,
  w_city varchar(20) default NULL,
  w_state char(2) default NULL,
  w_zip varchar(9) default NULL,
  w_tax double default NULL,
  w_ytd decimal(24,12) default NULL,
  PRIMARY KEY  (w_id)
);
