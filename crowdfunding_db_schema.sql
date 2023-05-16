-- Create Campaign Table 
create table campaign(
	cf_id int not null,
	contact_id int not null,
	company_name varchar not null,
	description varchar not null,
	goal float not null, 
	pledged float not null,
	outcome varchar not null,
	backers_count int not null,
	country varchar not null,
	currency varchar not null,
	launched_date date not null,
	end_date date not null,
	category varchar not null,
	sub_category varchar not null,
	category_id varchar not null,
	subcategory_id varchar not null,
	primary key (contact_id),
	foreign key (category_id) references Category(category_id),
	foreign key (subcategory_id) references SubCategory(subcategory_id)
)

-- Create Sub-Category Table
create table SubCategory (
	subcategory_id varchar not null,
	subcategory varchar not null,
	primary key (subcategory_id)
)

-- Create Category Table
create table Category (
	category_id varchar not null,
	category varchar not null,
	primary key (category_id)
)

-- Create Contacts tables
create table contacts (
	contact_id int not null,
	first_name varchar not null,
	last_name varchar not null,
	email varchar not null,
	foreign key (contact_id) references campaign(contact_id)
)


select * from subcategory