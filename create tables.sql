CREATE TABLE "salesperson" (
  "salesperson_id" serial,
  "first_name" varchar(100),
  "last_name" varchar(100),
  "email" varchar(100),
  "address" varchar(100),
  "phone_number" varchar(100),
  PRIMARY KEY ("salesperson_id")
);

CREATE TABLE "car" (
  "serial_number" serial,
  "make" varchar(100),
  "model" varchar(100),
  "year" int,
  "license_plate" varchar(100),
  "new_or_used" varchar(100),
  "mileage" int,
  PRIMARY KEY ("serial_number")
);

CREATE TABLE "customer" (
  "customer_id" serial,
  "first_name" varchar(100),
  "last_name" varchar(100),
  "address" varchar(100),
  "phone_number" varchar(100),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "invoice" (
  "payment_id" serial,
  "customer_id" int,
  "salesperson_id" int,
  "serial_number" int,
  "sale_date" DATE,
  "price" decimal(10,2),
  PRIMARY KEY ("payment_id"),
  CONSTRAINT "FK_invoice.salesperson_id"
    FOREIGN KEY ("salesperson_id")
      REFERENCES "salesperson"("salesperson_id"),
  CONSTRAINT "FK_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_invoice.serial_number"
    FOREIGN KEY ("serial_number")
      REFERENCES "car"("serial_number")
);

CREATE TABLE "mechanic" (
  "mechanic_id" serial,
  "first_name" varchar(100),
  "last_name" varchar(100),
  "address" varchar(100),
  "phone_number" varchar(100),
  PRIMARY KEY ("mechanic_id")
);

CREATE TABLE "service_ticket" (
  "ticket_num" serial,
  "mechanic_id" int,
  "customer_id" int,
  "serial_number" int,
  "service_start" date,
  "service_end" date,
  "service_price" decimal(10,2),
  "parts_price" decimal(10,2),
  "total_price" decimal(10,2),
  "service_type" text[],
  PRIMARY KEY ("ticket_num"),
  CONSTRAINT "FK_service_ticket.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_service_ticket.mechanic_id"
    FOREIGN KEY ("mechanic_id")
      REFERENCES "mechanic"("mechanic_id"),
  CONSTRAINT "FK_service_ticket.serial_number"
    FOREIGN KEY ("serial_number")
      REFERENCES "car"("serial_number")
);

CREATE TABLE "inventory" (
  "upc" serial,
  "product_amount" int,
  PRIMARY KEY ("upc")
);

CREATE TABLE "part" (
  "item_id" serial,
  "price" decimal(10,2),
  "product_name" varchar(100),
  "upc" int,
  "brand" varchar(100),
  PRIMARY KEY ("item_id"),
  CONSTRAINT "FK_part.upc"
    FOREIGN KEY ("upc")
      REFERENCES "inventory"("upc")
);

CREATE TABLE "part_used" (
  "part_use_id" serial,
  "upc" int,
  "ticket_num" int,
  "amount" int,
  PRIMARY KEY ("part_use_id"),
  CONSTRAINT "FK_part_used.ticket_num"
    FOREIGN KEY ("ticket_num")
      REFERENCES "service_ticket"("ticket_num"),
  CONSTRAINT "FK_part_used.upc"
    FOREIGN KEY ("upc")
      REFERENCES "inventory"("upc")
);