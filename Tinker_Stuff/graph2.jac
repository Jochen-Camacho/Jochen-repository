node main_questions;
node questions;

walker init{
    genbus = spawn here --> node::main_questions;
    appoint = spawn here --> node::main_questions;
    service = spawn here --> node::main_questions;

    office_hours = spawn genbus --> node::questions;
    payment_methods = spawn genbus --> node::questions;
    phone_numbers = spawn genbus --> node::questions;
    email = spawn genbus --> node::questions;
    promotions = spawn genbus --> node::questions;

    cancel_appointment = spawn appoint --> node::questions;
    reschedule_appointments = spawn appoint --> node::questions;
    refunds = spawn appoint --> node::questions;
    feedback = spawn appoint --> node::questions;

    manicures = spawn service --> node::questions;
    haircuts = spawn service --> node::questions;
    wedding_makeup = spawn service --> node::questions;
    eyebrows = spawn service --> node::questions;
    facial_treatments = spawn service --> node::questions;
    spa = spawn service --> node::questions;
}