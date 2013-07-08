// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Card = (function(_super) {
    __extends(Card, _super);

    function Card() {
      _ref = Card.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Card.prototype.initialize = function(params) {
      return this.set({
        revealed: true,
        value: !params.rank || 10 < params.rank ? 10 : params.rank,
        suitName: ['', 'Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit],
        suitNameX: ['', '&spades;', '&diams;', '&clubs;', '&hearts;'][params.suit],
        suitNameCSS: ['', 'spades', 'diams', 'clubs', 'hearts'][params.suit],
        rankName: (function() {
          switch (params.rank) {
            case 0:
              return 'K';
            case 1:
              return 'A';
            case 11:
              return 'J';
            case 12:
              return 'Q';
            default:
              return params.rank;
          }
        })(),
        valueCSS: (function() {
          switch (params.rank) {
            case 0:
              return 'k';
            case 1:
              return 'a';
            case 11:
              return 'j';
            case 12:
              return 'q';
            default:
              return params.rank;
          }
        })()
      });
    };

    Card.prototype.flip = function() {
      this.set('revealed', !this.get('revealed'));
      return this;
    };

    return Card;

  })(Backbone.Model);

}).call(this);

/*
//@ sourceMappingURL=Card.map
*/
