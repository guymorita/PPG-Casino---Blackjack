class window.CardView extends Backbone.View

  # className: 'card'

  template: _.template '
  <li>
      <a class="card rank-<%= valueCSS %> <%= suitNameCSS %>" href="#">
          <span class="rank"><%= rankName %></span>
          <span class="suit"><%= suitNameX %></span>
      </a>
  </li>
  '

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    # debugger
    @$el.children().children()[0].className = 'card back covered' unless @model.get 'revealed'
