select * from SharkTank..data

-- Total no. of episoides in the show
select count(distinct epno) as TotalEpisodes from SharkTank..data;

--Total no. of pitches in the show
select count(distinct brand) as TotalPitches from SharkTank..data;

--No. of companies that got funding
select sum(a.FundingFlag) as FundingRecieved,count(*) as TotalPitches from(
select AmountInvestedlakhs, case when AmountInvestedlakhs>0 then 1 else 0 end as FundingFlag from SharkTank..data)a

--Total male entrepreneur
select sum(male) as Total_Males from SharkTank..data

--Total female entrepreneur
select sum(female) as Total_Females from SharkTank..data

--Gender Ratio
select sum(female)/sum(male) as GenderRatio from SharkTank..data

--Total Amount Invested
select sum(amountinvestedlakhs) as Total_investment_lakh from SharkTank..data

--Average Equity
select avg(a.equitytaken) from(
select equitytaken from SharkTank..data where EquityTaken>0)a

--Highest Investment
select max(a.amountinvestedlakhs) as MaximumInvestment, min(a.AmountInvestedlakhs) as MinimumInvestment 
from (select * from SharkTank..data where AmountInvestedlakhs is not null and AmountInvestedlakhs!=0) as a

--Highest equity taken by the shark with brand name
select top 1 brand,equitytaken from SharkTank..data order by equitytaken desc

--Brands having atleast 1 female candidate
select sum(a.FemaleContBrands) as Startups_Having_atleast_1_Female from(
select brand,case when female>0 then 1 else 0 end as FemaleContBrands from SharkTank..data)a

--Invested startups that had at least 1 woman
select sum(b.femalePres)as Successfull_startups_with_women from(
select a.*,case when a.female>0 then 1 else 0 end as femalePres from(
select * from SharkTank..data where Deal!='No Deal')a)b

--Average Team size
select avg(teammembers) as AvgNoOfTeamMembers from SharkTank..data

--Average amount invested per deal
select avg(a.AmountInvestedlakhs) as AvgAmtInvested from(
select * from SharkTank..data where Deal!='No Deal') as a 

--Age group of the contestants
select AvgAge,COUNT(AvgAge) from SharkTank..data group by AvgAge order by count(AvgAge) desc

--Location group of contestants
select Location,count(Location) as cnt from SharkTank..data group by Location order by cnt desc

--Sectors of contestants
select Sector,count(Sector) as cnt from SharkTank..data group by Sector order by cnt desc

--Most deals by Shark
select partners, count(partners) as cnt from SharkTank..data where Partners!='-' group by partners order by cnt desc

--Deals by Ashneer
/* Total Deals where Ashneer was present */
select count(AshneerAmountInvested) from SharkTank..data where AshneerAmountInvested is not null
/* Total deals where Ashneer invested */
select count(AshneerAmountInvested) from SharkTank..data where AshneerAmountInvested is not null and AshneerAmountInvested!=0
/* Total investment and average equity taken  by Asneer*/
select sum(a.AshneerAmountInvested),AVG(a.AshneerEquityTaken) 
from(select * from SharkTank..data where AshneerEquityTaken is not null and AshneerEquityTaken!=0) as a

--Deals by Namita
/* Total Deals where Namita was present */
select count(NamitaAmountInvested) from SharkTank..data where NamitaAmountInvested is not null
/* Total deals where Namita invested */
select count(NamitaAmountInvested) from SharkTank..data where NamitaAmountInvested is not null and NamitaAmountInvested!=0
/* Total investment and average equity taken  by Namita*/
select sum(a.NamitaAmountInvested),AVG(a.NamitaEquityTaken) 
from(select * from SharkTank..data where NamitaEquityTaken is not null and NamitaEquityTaken!=0) as a

--Deals by Anupam
/* Total Deals where Anupam was present */
select count(AnupamAmountInvested) from SharkTank..data where AnupamAmountInvested is not null
/* Total deals where Anupam invested */
select count(AnupamAmountInvested) from SharkTank..data where AnupamAmountInvested is not null and AnupamAmountInvested!=0
/* Total investment and average equity taken  by Anupam*/
select sum(a.AnupamAmountInvested),AVG(a.AnupamEquityTaken) 
from(select * from SharkTank..data where AnupamEquityTaken is not null and AnupamEquityTaken!=0) as a

--Deals by Vineeta
/* Total Deals where Vineeta was present */
select count(VineetaAmountInvested) from SharkTank..data where VineetaAmountInvested is not null
/* Total deals where Vineeta invested */
select count(VineetaAmountInvested) from SharkTank..data where VineetaAmountInvested is not null and VineetaAmountInvested!=0
/* Total investment and average equity taken  by Vineeta*/
select sum(a.VineetaAmountInvested),AVG(a.VineetaEquityTaken) 
from(select * from SharkTank..data where VineetaEquityTaken is not null and VineetaEquityTaken!=0) as a

--Deals by Aman
/* Total Deals where Aman was present */
select count(AmanAmountInvested) from SharkTank..data where AmanAmountInvested is not null
/* Total deals where Aman invested */
select count(AmanAmountInvested) from SharkTank..data where AmanAmountInvested is not null and AmanAmountInvested!=0
/* Total investment and average equity taken  by Aman*/
select sum(a.AmanAmountInvested),AVG(a.AmanEquityTaken) 
from(select * from SharkTank..data where AmanEquityTaken is not null and AmanEquityTaken!=0) as a
