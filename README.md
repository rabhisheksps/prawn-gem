* Use 'rails assets:precompile" as it's using css

* Bundle "prawn" gem in the gemfile

* Create a function "download" in posts controller

* Call "generate_post_pdf" function defined in model to create an instance of the document.
  Also provide the options for styling, header and footer.

* Try to keep the controller thin and handle logic in the model.
