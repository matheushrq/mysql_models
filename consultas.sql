select	concat(contactFirstName, ' ', upper(contactLastName)) as customer_name
from	customers
order	by customerNumber