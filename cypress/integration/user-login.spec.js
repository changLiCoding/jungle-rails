/* eslint-disable */

describe("roots or products page", () => {
	beforeEach(() => {
		cy.visit("/");
	});
	it("There is products on the page", () => {
		cy.get(".products article").should("be.visible");
	});

	it("displays roots with abouts text", () => {
		cy.get(".intro p").should("have.length", 3);

		cy.get(".intro p")
			.first()
			.contains("Looking for a way to add some life to your home?");
		cy.get(".intro p")
			.last()
			.contains(
				"We have a wide variety of plants and flowers available for purchase on our website"
			);
	});

	it("There is 2 products on the page", () => {
		cy.get(".products article").should("have.length", 2);
	});

	it("The sign up button should be clicked from home page and jump into sign up page with relevent URL. And it will tragger error when submit with out email or password", () => {
		cy.get("ul.navbar-nav li.nav-item").contains("Sign Up!").click();
		cy.wait(1000);
		cy.url().should("include", "sign_up");
	});

	it("The sign up page should be able to create account successfully, and log in after sign up. ", () => {
		cy.get("ul.navbar-nav li.nav-item").contains("Sign Up!").click();
		cy.wait(1000);
		cy.url().should("include", "sign_up");
		cy.get("form").should("exist");
		cy.get("form").submit();
		cy.get("div.alert.alert-danger").should(
			"contain",
			"Password can't be blank"
		);
		cy.get("div.alert.alert-danger").should("contain", "E mail can't be blank");
		cy.get("div.alert.alert-danger").should(
			"contain",
			"First name can't be blank"
		);
	});

	it("The sign up page would sign user up when all required data input. And let user sign in right after. User can also log out.", () => {
		cy.visit("/sign_up");
		cy.get("#user_first_name").type("John");
		cy.get("#user_last_name").type("Doe");
		cy.get("#user_e_mail").type("johndoe@example.com");
		cy.get("#user_password").type("password");
		cy.get("#user_password_confirmation").type("password");
		cy.get("form").submit();
		cy.wait(1000);
		cy.get("header div div.alert.alert-warning p").should(
			"contain",
			"User Signed Up!"
		);
		cy.get("div.collapse.navbar-collapse ul li.nav-item").should(
			"contain",
			"johndoe@example.com"
		);
		cy.get("a.btn.btn-info").contains("LogOut").click();
		cy.get("header div div.alert.alert-warning p").should(
			"contain",
			"Logged Out"
		);
	});

	it("The sign in button should be clicked from home page and jump into sign in page with relevent URL.", () => {
		cy.get("ul.navbar-nav li.nav-item").contains("Sign In!").click();
		cy.wait(1000);
		cy.url().should("include", "sign_in");
	});

	it("The sign in page should tragger error when submit with wrong email or password", () => {
		cy.visit("/sign_in");
		cy.url().should("include", "sign_in");

		cy.wait(1000);
		cy.get("form").should("exist");
		cy.get("#e_mail").type("johndoe@example.com");
		cy.get("#password").type("password1234");
		cy.get("form").submit();

		cy.get("main div.alert.alert-dismissible p").should(
			"contain",
			"Invalid Email or password."
		);
	});

	it("The sign in page should sign in when submit with right email and password. And the user can also log out.", () => {
		cy.visit("/sign_in");
		cy.url().should("include", "sign_in");

		cy.wait(1000);
		cy.get("form").should("exist");
		cy.get("#e_mail").type("johndoe@example.com");
		cy.get("#password").type("password");
		cy.get("form").submit();

		cy.get("header div div.alert.alert-warning p").should(
			"contain",
			"User Signed In Successfully!"
		);
		cy.get("a.btn.btn-info").contains("LogOut").click();
		cy.get("header div div.alert.alert-warning p").should(
			"contain",
			"Logged Out"
		);
	});

	it("The sign up page would show error message if the email has been registered already. ", () => {
		cy.visit("/sign_up");
		cy.get("#user_first_name").type("John");
		cy.get("#user_last_name").type("Doe");
		cy.get("#user_e_mail").type("johndoe@example.com");
		cy.get("#user_password").type("password");
		cy.get("#user_password_confirmation").type("password");
		cy.get("form").submit();
		cy.wait(1000);
		cy.get("div.alert.alert-danger").should(
			"contain",
			"E mail has already been taken"
		);
	});
});
