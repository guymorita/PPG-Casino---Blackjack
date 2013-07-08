// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.AllHandsView = (function(_super) {
    __extends(AllHandsView, _super);

    function AllHandsView() {
      _ref = AllHandsView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AllHandsView.prototype.template = _.template('');

    AllHandsView.prototype.initialize = function() {
      debugger;
      return this.render();
    };

    AllHandsView.prototype.render = function() {
      this.$('.player-hand-container span ul').html(new HandView({
        collection: this.model.get('playerHand')
      }).el);
      return this.$('.dealer-hand-container span ul').html(new HandView({
        collection: this.model.get('dealerHand')
      }).el);
    };

    return AllHandsView;

  })(Backbone.View);

}).call(this);

/*
//@ sourceMappingURL=AllHandsView.map
*/
