Create Table titles
	(title_id Int Not Null auto_increment Primary Key)
    Select Distinct Replace(Replace(`Title.Description`, '*', ''), '?', '') as title 
    From pay 
    Order By title;

Create Table agencies
	(agency_id Int Not Null auto_increment Primary Key)
    Select Distinct `Agency.Name` as agency 
    From pay 
    Order By agency;

Create Table personnel
	(person_id Int Not Null auto_increment Primary Key)
    Select Distinct `First.Name` as first_name, 
    `Mid.Init` as mid_init, 
    `Last.Name` as last_name 
    From pay 
    Order By last_name;

Create Table boroughs
	(borough_id Int Not Null auto_increment Primary Key)
    Select Distinct `Work.Location.Borough` as borough 
    From pay 
    Order By borough;

Create Table Employments
Select a.borough_id, b.person_id, c.agency_id, d.title_id, e.* From
boroughs as a,
personnel as b,
agencies as c,
titles as d,
pay as e
Where (a.borough = e.`Work.Location.Borough`)
And (b.first_name = e.`First.Name`)
And (b.last_name = e.`Last.Name`)
And (b.mid_init = e.`Mid.Init`)
And (c.agency = e.`Agency.Name`)
And (d.title = e.`Title.Description`);
    
Alter Table Employments Add Foreign Key (borough_id) References boroughs(borough_id);

Alter Table Employments Add Foreign Key (person_id) References personnel(person_id);

Alter Table Employments Add Foreign Key (agency_id) References agencies(agency_id);

Alter Table Employments Add Foreign Key (title_id) References titles(title_id);

Alter Table Employments Drop Column `First.Name`;
Alter Table Employments Drop Column `Mid.Init`;
Alter Table Employments Drop Column `Last.Name`;
Alter Table Employments Drop Column `Title.Description`;
Alter Table Employments Drop Column `Agency.Name`;
Alter Table Employments Drop Column `Work.Location.Borough`;