create schema dwh_detailed;

create table dwh_detailed.manufacturers_anchor (
    id bigint not null primary key
);

create table dwh_detailed.products_anchor (
    id bigint not null primary key
);

create table dwh_detailed.categories_anchor (
    id bigint not null primary key
);

create table dwh_detailed.stores_anchor (
    id bigint not null primary key
);

create table dwh_detailed.deliveries_anchor (
    id bigint not null primary key
);

create table dwh_detailed.customers_anchor (
    id bigint not null primary key
);

create table dwh_detailed.purchases_anchor (
    id bigint not null primary key
);

create table dwh_detailed.manufacturers_attributes (
    id bigint not null,
    name varchar(100) not null,
    legal_entity varchar(100) not null,
    valid_from timestamp not null,
    primary key (id, valid_from)
);

create table dwh_detailed.products_attributes (
    id bigint not null,
    name varchar(255) not null,
    picture_url varchar(255) not null,
    description varchar(255) not null,
    age_restriction int,
    valid_from timestamp not null,
    primary key (id, valid_from)
);

create table dwh_detailed.categories_attributes (
    id bigint not null,
    name varchar(100) not null,
    valid_from timestamp not null,
    primary key (id, valid_from)
);

create table dwh_detailed.customers_attributes (
    id bigint not null,
    fname varchar(100) not null,
    lname varchar(100) not null,
    gender varchar(100) not null,
    phone varchar(100) not null,
    valid_from timestamp not null,
    primary key (id, valid_from)
);

create table dwh_detailed.stores_attributes (
    id bigint not null,
    name varchar(255) not null,
    country varchar(255) not null,
    city varchar(255) not null,
    address varchar(255) not null,
    valid_from timestamp not null,
    primary key (id, valid_from)
);

create table dwh_detailed.deliveries_attributes (
    id bigint not null,
    date date not null,
    product_count int,
    valid_from timestamp not null,
    primary key (id, valid_from)
);

create table dwh_detailed.purchases_attributes (
    id bigint not null,
    date timestamp not null,
    payment_type varchar(100) not null,
    valid_from timestamp not null,
    primary key (id, valid_from)
);

create table dwh_detailed.price_change_attributes (
    product_id bigint not null,
    change_ts timestamp not null,
    new_price numeric(9,2) not null,
    valid_from timestamp not null,
    primary key (product_id, valid_from)
);

create table dwh_detailed.products_manufacturers_ties (
    product_id bigint not null,
    manufacturer_id bigint not null,
    valid_from timestamp not null,
    primary key (product_id, manufacturer_id, valid_from)
);

create table dwh_detailed.products_categories_ties (
    product_id bigint not null,
    category_id bigint not null,
    valid_from timestamp not null,
    primary key (product_id, category_id, valid_from)
);

create table dwh_detailed.deliveries_products_ties (
    delivery_id bigint not null,
    product_id bigint not null,
    valid_from timestamp not null,
    primary key (delivery_id, product_id, valid_from)
);

create table dwh_detailed.deliveries_stores_ties (
    delivery_id bigint not null,
    store_id bigint not null,
    valid_from timestamp not null,
    primary key (store_id, delivery_id, valid_from)
);

create table dwh_detailed.purchases_stores_ties (
    purchase_id bigint not null,
    store_id bigint not null,
    valid_from timestamp not null,
    primary key (store_id, purchase_id, valid_from)
);

create table dwh_detailed.purchases_customers_ties (
    purchase_id bigint not null,
    customer_id bigint not null,
    valid_from timestamp not null,
    primary key (customer_id, purchase_id, valid_from)
);

alter table dwh_detailed.manufacturers_attributes add foreign key (id) references dwh_detailed.manufacturers_anchor (id);

alter table dwh_detailed.categories_attributes add foreign key (id) references dwh_detailed.categories_anchor (id);

alter table dwh_detailed.products_attributes add foreign key (id) references dwh_detailed.products_anchor(id);

alter table dwh_detailed.stores_attributes add foreign key (id) references dwh_detailed.stores_anchor (id);

alter table dwh_detailed.deliveries_attributes add foreign key (id) references dwh_detailed.deliveries_anchor (id);

alter table dwh_detailed.customers_attributes add foreign key (id) references dwh_detailed.customers_anchor (id);

alter table dwh_detailed.purchases_attributes add foreign key (id) references dwh_detailed.purchases_anchor (id);

alter table dwh_detailed.price_change_attributes add foreign key (product_id) references dwh_detailed.products_anchor (id);

alter table dwh_detailed.products_manufacturers_ties add foreign key (product_id) references dwh_detailed.products_anchor (id);
alter table dwh_detailed.products_manufacturers_ties add foreign key (manufacturer_id) references dwh_detailed.manufacturers_anchor (id);

alter table dwh_detailed.products_categories_ties add foreign key (product_id) references dwh_detailed.products_anchor (id);
alter table dwh_detailed.products_categories_ties add foreign key (category_id) references dwh_detailed.categories_anchor (id);

alter table dwh_detailed.deliveries_products_ties add foreign key (delivery_id) references dwh_detailed.deliveries_anchor (id);
alter table dwh_detailed.deliveries_products_ties add foreign key (product_id) references dwh_detailed.products_anchor (id);

alter table dwh_detailed.deliveries_stores_ties add foreign key (delivery_id) references dwh_detailed.deliveries_anchor (id);
alter table dwh_detailed.deliveries_stores_ties add foreign key (store_id) references dwh_detailed.stores_anchor (id);

alter table dwh_detailed.purchases_stores_ties add foreign key (purchase_id) references dwh_detailed.purchases_anchor (id);
alter table dwh_detailed.purchases_stores_ties add foreign key (store_id) references dwh_detailed.stores_anchor (id);

alter table dwh_detailed.purchases_customers_ties add foreign key (purchase_id) references dwh_detailed.purchases_anchor (id);
alter table dwh_detailed.purchases_customers_ties add foreign key (customer_id) references dwh_detailed.customers_anchor (id);
