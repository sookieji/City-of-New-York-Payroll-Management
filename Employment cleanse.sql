SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'employments';

ALTER TABLE employments MODIFY COLUMN `Agency.Start.Date` date;
ALTER TABLE employments MODIFY COLUMN `OT.Hours` int;
ALTER TABLE employments MODIFY COLUMN `Regular.Gross.Paid` int;
ALTER TABLE employments MODIFY COLUMN `Total.OT.Paid` int;
ALTER TABLE employments MODIFY COLUMN `Total.Other.Pay` int;

SELECT *
FROM employments
WHERE borough_id is null
OR person_id is null
OR agency_id is null
OR title_id is null
OR `Fiscal.Year` is null
OR `Payroll.Number` is null
OR `Agency.Start.Date` is null
OR `Leave.Status.as.of.June.30` like ' %'
OR `Leave.Status.as.of.June.30` like '% '
OR `Leave.Status.as.of.June.30` is null
OR `Base.Salary` is null
OR `Pay.Basis` like ' %'
OR `Pay.Basis` like '% '
OR `Pay.Basis` is null
OR `Regular.Hours` is null
OR `Regular.Hours` < 0
OR `Regular.Gross.Paid` is null
OR `Regular.Gross.Paid` < 0
OR `OT.Hours` is null
OR `OT.Hours` < 0
OR `Total.OT.Paid` is null
OR `Total.OT.Paid` < 0
OR `Total.Other.Pay` is null
OR `Total.Other.Pay` < 0;

DELETE FROM employments WHERE `regular.hours` < 0 OR `regular.gross.paid` <0 OR `ot.hours` < 0 OR `total.ot.paid` < 0 OR `Total.Other.Pay` <0;