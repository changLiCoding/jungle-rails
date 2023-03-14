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
	it("The 2 product cards show 4 spans to show information about the 2 prducts", () => {
		cy.get(".products article")
			.get("a h1 span")
			.should("have.length", 4)
			.first()
			.should("contain", "Scented Blade")
			.siblings()
			.eq(0)
			.contains("$24.99");
	});

	it("When product 1 got clicked the url jumped to the show product page and show relevant information", () => {
		cy.contains("Scented Blade").click();
		cy.url().should("include", "products/2");
		cy.contains(
			"The Scented Blade is an extremely rare, tall plant and can be found mostly"
		);
	});
	it("When product 2 got clicked the url jumped to the show product page and show relevant information", () => {
		cy.contains("Giant Tea").click();
		cy.url().should("include", "products/1");
		cy.contains(
			"The Giant Tea is an uncommon, medium-sized plant and can be found only in some tundras. It blooms twice a year, for 3 weeks"
		);
	});
});
