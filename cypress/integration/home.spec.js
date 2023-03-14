/* eslint-disable */

describe("roots or products page", () => {
	beforeEach(() => {
		cy.visit("/");
	});
	it("There is products on the page", () => {
		cy.get(".products article").should("be.visible");
	});
	it("There is 2 products on the page", () => {
		cy.get(".products article").should("have.length", 2);
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
});
