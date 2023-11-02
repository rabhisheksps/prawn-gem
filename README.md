* Use 'rails assets:precompile" as it's using css

* Bundle "prawn" gem in the gemfile

* Created a function "download" in posts controller

* Calling "generate_post_pdf" function defined in model to create an instance of the document.
  Also providing the options for styling, header and footer.

* Trying to keep the controller thin and handle logic in the model.
