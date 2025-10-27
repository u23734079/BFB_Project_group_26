Smartwash 

In this project, we aimed to improve the bottleneck in the university’s laundry system. As Industrial Engineering students,
we applied Root Cause Analysis to identify the underlying problems.We developed a web-based platform that acts as a middleman,
connecting students with laundry service providers. On this platform, available laundry slots are listed on the website, 
allowing students to make requests only when a slot is open. If no slots are available, students cannot place a request.

Once a request is made, the laundry is collected directly from the student’s residence.
The system provides a real-time status indicator that shows the driver’s location and progress on the service/product page. 
After the laundry is completed, the system updates the service page to show completion, allowing students to request delivery of their clean clothes.

The laundry service provider then charges students residencer  based on the completed laundry per residence, using the data automatically provided by the system.

Installation/setup instructions

This system currently works through a website. The backend and frontend have been created but are not yet linked.
As a result, you cannot log in, but you can still access the dashboard page to get a real feel of how the website operates — since normally,
the dashboard is only accessible after signing up.

The website is backed up by a database that contains ERD tables which store user information and details about the customer order.
The signup table will be linked to the signup/ login page of the website and it will basically store customer details to the database. It will store customer details upon the specified attributes of the signup table, namely, customer_id, full name,email, cell number, reisdential address and password.
The queriers table will be linked to the query page of the website and it will store details about customer queries so that it easier to help customers when they face challenges.
It takes the customer_id attribute as a foreign key in order to link queries directly to specific customers.
The slot table is another essential table for the website back-end. This table will link to the order placement/ slot selection page of the website, allowing customers to select slots for orders at specific times and days of the month.
The slot table is linked to the timeseek and dayofmonth table to allow for order placement on specific times and days of the month. What links the slot table to the timeseek and dayofmonth table is the foreign keys associated with those tables, evident on the slot table. The individual foreign keys basically allow the selection of times of the day and days of the month for a customer order.

The Home, Contact Us, and Privacy Policy pages are repeated because there are versions for both logged-in and logged-out users.
The only differences between them are in the header and footer sections.

Click Home 1 to view the actual homepage. There is also an Admin Page that allows control over the product status displayed on the user’s product page.


Group 26

u23711044 KB Mhlanga

u23755882 PV Mojela

u23734079 D Langa



