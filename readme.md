# Basic SOL question and Answer

### 1. What is PostgreSQL?

PostgreSQL হল একটি ওপেন সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS) যা SQL ভাষা ব্যবহার করে ডাটা সংরক্ষণ করার জন্য ডিজাইন করা হয়েছে। এটি ACID (Atomicity, Consistency, Isolation, Durability) সমর্থন করে জটিল ডাটাবেস সিস্টেমে ব্যবহারের জন্য উপযুক্ত। PostgreSQL একাধিক ডাটা টাইপ এবং কাস্টম ফাংশন সমর্থন করে ।

### 2. What is the purpose of a database schema in PostgreSQL?

ডাটাবেস স্কিমা হল একটি কন্টেইনার, যা টেবিল, ভিউ, ইনডেক্স, ফাংশন, ইত্যাদি ডাটাবেস অবজেক্টগুলো কে গ্রুপ করে। এটি ডাটাবেসের মধ্যে অবজেক্টগুলোর কাজ করার জন্য একটি কাঠামো প্রদান করে। স্কিমা ব্যবহারের মাধ্যমে ডাটাবেসের নিরাপত্তা এবং অ্যাক্সেস কন্ট্রোল সহজ হয়।

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

- Primary Key: একটি টেবিলের প্রতিটি row জন্য একটি ইউনিক key প্রদান করে। এটি null মান হতে পারে না । টেবিলের জন্য একটি একক অথবা কম্বাইন Primary Key থাকতে পারে।

- Foreign Key: এটি এক টেবিলের একটি কলাম যা অন্য টেবিলের Primary Key বা Unique Key এর সাথে সম্পর্কিত। Foreign Key টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করে এবং referential integrity নিশ্চিত করে।

### 4. What is the difference between the VARCHAR and CHAR data types?

- VARCHAR: একটি ফ্লাকজিবল-লেংথ স্ট্রিং ডাটা টাইপ যা শুধু প্রয়োজনীয় পরিমাণ ক্যারেক্টার স্টোর করে | এটি স্টোরেজে কম জায়গা নেয়।

- CHAR: একটি ফিক্সট-লেংথ স্ট্রিং ডাটা টাইপ যা নির্দিষ্ট length অনুযায়ী স্টোর করে | যদি CHAR(10) হয় তবে ১০টি ক্যারেক্টার স্টোর করতে হবে | যদি স্ট্রিংয়ের দৈর্ঘ্য ৫ হয় তবুও বাকি ৫টি স্থান ফাঁকা রাখে।

### 5. Explain the purpose of the WHERE clause in a SELECT statement.

WHERE ক্লজ ব্যবহার করে নির্দিষ্ট শর্ত অনুযায়ী ডাটা get করা যায়। এটি ডাটাবেসের টেবিল থেকে শুধুমাত্র সেই সারিগুলি get করে যা শর্ত এর সাথে মিলে।

### 6. What are the LIMIT and OFFSET clauses used for?

- LIMIT: এটি মূলত পেজিনেশনের জন্য ব্যবহার হয়। যখন কোন টেবিল থকে নির্দিষ্ট পরিমান ডাটা দরকার হয় তখন এটির দরকার হয় যেমন LIMIT 5 কেবল ৫টি ডাটা রিটার্ন করবে।

- OFFSET: এটি get করা ডাটা থকে কত তম ডাটা থকে ডাটা রিটার্ন করবে তা নির্দেশ করে। এটি সাধারণত পেজিনেশন (pagination) জন্য ব্যবহৃত হয়।

### 7. How can you modify data using UPDATE statements?

UPDATE স্টেটমেন্ট ব্যবহার করে টেবিলের একটি বা একাধিক row এর ডাটা পরিবর্তন করা যায়। SET ক্লোজ ব্যবহার করে যেই কলামগুলি আপডেট করতে হবে তা উল্লেখ করতে হয়, এবং WHERE ক্লজ দিয়ে কোন row টি পরিবর্তন হবে তা নির্দেশ করে।

উদাহরণ:

```sql
UPDATE books
SET price = 40
WHERE id = 10;
```

### 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

JOIN অপারেশন একাধিক টেবিলের মধ্যে সম্পর্ক তৈরি করে এবং তাদের ডাটা একত্রে get করতে সাহায্য করে। এটি মূলত একটি রেফারেন্স কলাম থেকে ডাটা নেয় এবং অন্য একটি টেবিলের রেফার্ড কলামের সাথে মিলিয়ে আনে। বিভিন্ন ধরনের JOIN অপারেশন আছে যেমন INNER JOIN, LEFT JOIN, RIGHT JOIN, এবং FULL JOIN রয়েছে।

### 9. Explain the GROUP BY clause and its role in aggregation operations.

GROUP BY ক্লজ একটি কুয়েরির মধ্যে ডাটাকে এক বা একাধিক কলামের মান অনুসারে গ্রুপ করে। এটি সাধারণত অ্যাগ্রিগেট ফাংশন যেমন COUNT(), SUM(), AVG() এর সাথে ব্যবহৃত হয়, যা প্রতিটি গ্রুপের ওপর বিশেষ কুয়েরি করতে সাহায্য করে।

### 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

- COUNT(): এটি নির্দিষ্ট কলামের সংখ্যা গননা করে।

```sql
SELECT COUNT(*) FROM books;
```

- SUM(): এটি একটি কলামের সমস্ত মান যোগ করে।

```sql
SELECT SUM(price) FROM books;
```

- AVG(): এটি একটি কলামের গড় মান হিসাব করে।

```sql
SELECT AVG(price) FROM books;
```
