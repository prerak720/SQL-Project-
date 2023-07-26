create PROCEDURE DBO.SP_edata (@JSON NVARCHAR(MAX))

AS

BEGIN

DROP TABLE IF EXISTS #E_DATA

CREATE TABLE #E_DATA
([PRODUCT ID] NVARCHAR(MAX),
[ENGAGEMENT ID] NVARCHAR(MAX),
ORG_NAME NVARCHAR(MAX),
CREATEDDATE NVARCHAR(MAX),
UPDATEDDATETIME NVARCHAR(MAX), 
EXPIRATIONDATE NVARCHAR(MAX),

STATUS NVARCHAR(MAX), SUBSTATUS NVARCHAR(MAX), STATUSREASON NVARCHAR(MAX),

COMPANY_NAME NVARCHAR(MAX),
ADDRESSLINE1 NVARCHAR(MAX),
ADDRESSLINE2 NVARCHAR(MAX),
CITY  NVARCHAR(MAX),
STATE  NVARCHAR(MAX),
COUNTRY  NVARCHAR(MAX),
FIRST_NAME  NVARCHAR(MAX),
LAST_NAME  NVARCHAR(MAX),
PHONENUMBER  NVARCHAR(MAX),
EMAIL  NVARCHAR(MAX),
CURRENCY  NVARCHAR(MAX),
VALUE  NVARCHAR(MAX)

)

INSERT INTO #E_DATA ([PRODUCT ID]
,[ENGAGEMENT ID]
,[ORG_NAME]
,[CREATEDDATE]
,[UPDATEDDATETIME]
,[EXPIRATIONDATE]
,[STATUS]
,[SUBSTATUS]
,[STATUSREASON]
,[COMPANY_NAME]
,[ADDRESSLINE1]
,[ADDRESSLINE2]
,[CITY]
,[STATE]
,[COUNTRY]
,[FIRST_NAME]
,[LAST_NAME]
,[PHONENUMBER]
,[EMAIL]
,[CURRENCY]
,[VALUE])
(
select [PRODUCT ID]
,[ENGAGEMENT ID]
,[ORG_NAME]
,[CREATEDDATE]
,[UPDATEDDATETIME]
,[EXPIRATIONDATE]
,[STATUS]
,[SUBSTATUS]
,[STATUSREASON]
,[COMPANY_NAME]
,[ADDRESSLINE1]
,[ADDRESSLINE2]
,[CITY]
,[STATE]
,[COUNTRY]
,[FIRST_NAME]
,[LAST_NAME]
,[PHONENUMBER]
,[EMAIL]
,[CURRENCY]
,[VALUE]

from openjson(@json)
with

(
 [PRODUCT ID]                      NVARCHAR(MAX)  '$.id'
,[ENGAGEMENT ID]				   NVARCHAR(MAX)  '$.engagementId'
,[ORG_NAME]						   NVARCHAR(MAX)  '$.organizationName'
,[CREATEDDATE]					   NVARCHAR(MAX)  '$.createdDateTime'
,[UPDATEDDATETIME]				   NVARCHAR(MAX)  '$.updatedDateTime'
,[EXPIRATIONDATE]				   NVARCHAR(MAX)  '$.expirationDateTime'
,[STATUS]						   NVARCHAR(MAX)  '$.status'
,[SUBSTATUS]					   NVARCHAR(MAX)  '$.substatus'
,[STATUSREASON]					   NVARCHAR(MAX)  '$.statusReason'
,[COMPANY_NAME]					   NVARCHAR(MAX)  '$.customerProfile.name'
,[ADDRESSLINE1]					   NVARCHAR(MAX)  '$.customerProfile.address.addressLine1'
,[ADDRESSLINE2]					   NVARCHAR(MAX)  '$.customerProfile.address.addressLine2'
,[CITY]							   NVARCHAR(MAX)  '$.customerProfile.address.city'
,[STATE]						   NVARCHAR(MAX)  '$.customerProfile.address.state'
,[COUNTRY]						   NVARCHAR(MAX)  '$.customerProfile.address.country'
,[FIRST_NAME]					   NVARCHAR(MAX)  '$.customerProfile.team.firstName' 
,[LAST_NAME]					   NVARCHAR(MAX)  '$.customerProfile.team.lastName' 
,[PHONENUMBER]					   NVARCHAR(MAX)  '$.customerProfile.team.phoneNumber' 
,[EMAIL]						   NVARCHAR(MAX)  '$.customerProfile.team.email' 
,[CURRENCY]						   NVARCHAR(MAX)  '$.details.currency'
,[VALUE]						   NVARCHAR(MAX)  '$.details.dealValue'

)

)

MERGE E_DATA AS  TARGET
USING #E_DATA AS SOURCE
ON TARGET.[PRODUCT ID] =SOURCE.[PRODUCT ID]

WHEN NOT MATCHED BY TARGET
THEN INSERT ( [PRODUCT ID]
,[ENGAGEMENT ID]
,[ORG_NAME]
,[CREATEDDATE]
,[UPDATEDDATETIME]
,[EXPIRATIONDATE]
,[STATUS]
,[SUBSTATUS]
,[STATUSREASON]
,[COMPANY_NAME]
,[ADDRESSLINE1]
,[ADDRESSLINE2]
,[CITY]
,[STATE]
,[COUNTRY]
,FIRST_NAME
,LAST_NAME
,[PHONENUMBER]
,[EMAIL]
,[CURRENCY]
,[VALUE]) VALUES (
 SOURCE.[PRODUCT ID]
,SOURCE.[ENGAGEMENT ID]
,SOURCE.[ORG_NAME]
,SOURCE.[CREATEDDATE]
,SOURCE.[UPDATEDDATETIME]
,SOURCE.[EXPIRATIONDATE]
,SOURCE.[STATUS]
,SOURCE.[SUBSTATUS]
,SOURCE.[STATUSREASON]
,SOURCE.[COMPANY_NAME]
,SOURCE.[ADDRESSLINE1]
,SOURCE.[ADDRESSLINE2]
,SOURCE.[CITY]
,SOURCE.[STATE]
,SOURCE.[COUNTRY]
,SOURCE.[FIRST_NAME]
,SOURCE.[LAST_NAME]
,SOURCE.[PHONENUMBER]
,SOURCE.[EMAIL]
,SOURCE.[CURRENCY]
,SOURCE.[VALUE]
);
END
exec SP_edata '[{
	"id": "d3ca5d20-0899-42a8-b9f7-5e9c06ad641d",
	"engagementId": "0ee9d55d-b7e9-4d3c-b76a-419a9d74a58a",
	"name": "Discover Sensitive Data Workshop",
	"organizationId": "1e2a4ff6-145c-46d2-ac2b-11ec80cbc601",
	"organizationName": "KPMG LLP",
	"lastModifiedVia": null,
	"lastRunId": null,
	"externalReferenceId": "",
	"createdDateTime": "2022-02-24T21:04:06.0372014Z",
	"updatedDateTime": "2022-02-24T21:12:46.1743218Z",
	"expirationDateTime": null,
	"status": "Active",
	"substatus": "Accepted",
	"statusReason": null,
	"qualification": "SalesQualified",
	"type": "Shared",
	"referralSource": null,
	"eTag": "\"69007a1e-0000-0800-0000-6217f4ce0000\"",
	"favorite": false,
	"campaignId": null,
	"salesStage": null,
	"quality": "Unknown",
	"isSpam": false,
	"direction": "Incoming",
	"mpnId": "1209668",
	"referralProgram": null,
	"dealSensitivity": "None",
	"createdVia": null,
	"tags": [],
	"acceptedDateTime": "2022-02-24T21:04:06.0368023Z",
	"closedDateTime": null,
	"callToAction": null,
	"registrationStatus": "None",
	"target": [
		{
			"type": "SolutionProfile",
			"id": "3a2fead4-d3fa-4fe9-819f-8062f6f3b2fe"
		},
		{
			"type": "SolutionProfile",
			"id": "4e0a923a-a5be-e911-a85f-000d3a1bbafa"
		}
	],
	"customerProfile": {

		"name": "VISTA OIL &amp; GAS ARGENTINA S.A.U.",
		"size": "",
		"isMatchingComplete": false,
		"address": {
			"addressLine1": "Avenida del Libertador 101",
			"addressLine2": null,
			"city": "Vicente López",
			"state": null,
			"postalCode": "B1638BEA",
			"country": "AR",
			"region": null

		},

		"team": [
			{

				"firstName": "MATIAS",
				"lastName": "SARANITI",
				"phoneNumber": "+5491153867232",
				"email": "matias.saraniti@vistaenergy.com",
				"title": null,
				"contactPreference": {
					"locale": null,
					"disableNotifications": true
				}
			}
		],
		"ids": [
			{
				"profileType": "Duns",
				"id": "970002754"
			}
		]
	},
	"consent": {
		"consentToToShareInfoWithOthers": true,
		"consentToContact": true,
		"consentToShareReferralWithMicrosoftSellers": true
	},
	"details": {
		"notes": null,
		"dealValue": 10000,
		"currency": "USD",
		"closingDateTime": "2022-03-04T03:00:00Z",
		"customerRequestedContact": null,
		"customerAction": null,
		"incentiveLevel": null,
		"requirements": {
			"industries": [],
			"products": [],
			"services": [],
			"solutions": [
				{

					"id": "3a2fead4-d3fa-4fe9-819f-8062f6f3b2fe",
					"name": "M365 E5 Compliance | Non-specific",
					"type": "Name",
					"price": null,
					"quantity": null,
					"currency": null,
					"publisherName": null,
					"solutionType": null,
					"closingDateTime": null
				},
				{

					"id": "4e0a923a-a5be-e911-a85f-000d3a1bbafa",
					"name": "M365 FLW Sec+Compliance - O365",
					"type": "Name",
					"price": null,
					"quantity": null,
					"currency": null,
					"publisherName": null,
					"solutionType": null,
					"closingDateTime": null
				}
			],
			"salesPlays": [],
			"additionalRequirements": {
				"iot": {
					"customerLicenseAgreementNumber": null,
					"deviceCategory": null,
					"siliconType": null,
					"azureCertifiedDevice": false,
					"attachServices": false
				}
			}
		}
	},
	"team": [

		{
			"firstName": "Emanuel",
			"lastName": "Martinez",
			"phoneNumber": "+5491167993193",
			"email": "emanuelmartinez@kpmg.com.ar",
			"title": null,
			"contactPreference": {
				"locale": null,
				"disableNotifications": null
			}
		}
	],
	"inviteContext": {
		"notes": null,
		"assistanceRequestCode": "Unknown",
		"invitedMpnId": "1209668",
		"invitedBy": {
			"organizationId": "1e2a4ff6-145c-46d2-ac2b-11ec80cbc601",
			"organizationName": "KPMG"
		}
	},
	"links": {
		"relatedReferrals": {
			"uri": "https://api.partner.microsoft.com/v1.0/engagements/referrals?$filter=engagementId eq 0ee9d55d-b7e9-4d3c-b76a-419a9d74a58a",
			"method": "GET"
		},
		"self": {
			"uri": "https://api.partner.microsoft.com/v1.0/engagements/referrals/d2ca6d20-0899-42a8-b9f7-5e9c06ad641d",
			"method": "GET"
		}
	},
	"trackingInfo": {
		"microsoftMsxId": null,
		"microsoftUSFedOpportunityId": null,
		"microsoftUSFedLeadId": null,
		"migratedPSCDealId": null,
		"migratedPSCPartnerDealId": null
	},

	"registrations": []

}]'
select * from [dbo].[E_DATA]