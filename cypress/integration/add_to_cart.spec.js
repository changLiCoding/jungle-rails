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

	it("The home page button Add to Cart can be clicked, and cart number will be incremented by 1", () => {
		cy.get("li.end-0 a.nav-link").should("contain", "My Cart (0)");
		cy.get(".button_to button")

			.contains("Add")
			.click({ force: true })
			.then(() => {
				cy.wait(1000);
				cy.get(".button_to button").contains("Add").click({ force: true });
			});
		cy.get("li.end-0 a.nav-link").should("contain", "My Cart (1)");
	});

	it("The product detail page button Add to Cart can be clicked, and cart number will be incremented by 1", () => {
		cy.get("li.end-0 a.nav-link").should("contain", "My Cart (0)");
		cy.contains("Scented Blade").click();
		cy.url().should("include", "products/2");
		cy.contains(
			"The Scented Blade is an extremely rare, tall plant and can be found mostly"
		);
		cy.get(".button_to button")
			.contains("Add")
			.click({ force: true })
			.then(() => {
				cy.wait(1000);
				cy.get(".button_to button").contains("Add").click({ force: true });
			});
		cy.get("li.end-0 a.nav-link").should("contain", "My Cart (1)");
	});
});
