// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.ChipView = (function(_super) {
    __extends(ChipView, _super);

    function ChipView() {
      _ref = ChipView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ChipView.prototype.className = 'chips';

    ChipView.prototype.template = _.template('\
    <div>\
    <button class="bet-1">Bet 1</button>\
    <button class="bet-5">Bet 5</button>\
    <button class="bet-10">Bet 10</button>\
    <button class="bet-25">Bet 25</button>\
    <button class="bet-50">Bet 50</button>\
    <button class="bet-100">Bet 100</button>\
    <button class="clear">Clear Bet</button>\
    <button class="all-in">All-in</button>\
    <button class="set_bet success" style="margin: 0px 0px 0px 20px">Set Bet</button>\
    </div>\
    </br>\
    <div class="stack"><h3><strong>Stack: <strong></h3></div>\
    </br>\
    <div class="bet"><h3><strong>Bet: </strong></h3></div>');

    ChipView.prototype.events = {
      "click .bet-1": function() {
        this.attemptBet(1);
        return this.trigger('bet');
      },
      "click .bet-5": function() {
        this.attemptBet(5);
        return this.trigger('bet');
      },
      "click .bet-10": function() {
        this.attemptBet(10);
        return this.trigger('bet');
      },
      "click .bet-25": function() {
        this.attemptBet(25);
        return this.trigger('bet');
      },
      "click .bet-50": function() {
        this.attemptBet(50);
        return this.trigger('bet');
      },
      "click .bet-100": function() {
        this.attemptBet(100);
        return this.trigger('bet');
      },
      "click .set_bet": function() {
        if (this.currentBet === 0) {
          return alert("You must make a bet sir/maam");
        } else {
          return this.model.set('betSet', true);
        }
      },
      "click .clear": function() {
        this.currentBet = 0;
        return this.trigger('bet');
      },
      "click .all-in": function() {
        this.currentBet = 0;
        this.attemptBet(this.currentStack);
        return this.trigger('bet');
      }
    };

    ChipView.prototype.attemptBet = function(amount) {
      if (this.currentStack >= this.currentBet + amount) {
        return this.currentBet += amount;
      } else {
        return alert("You don't have enough money");
      }
    };

    ChipView.prototype.initialize = function() {
      var _this = this;
      this.currentStack = this.model.get('chipStack');
      this.currentBet = 0;
      this.on('bet', function() {
        _this.model.set('curBet', _this.currentBet);
        return _this.render();
      });
      return this.render();
    };

    ChipView.prototype.render = function() {
      this.$el.children().detach();
      this.$el.html(this.template);
      this.$('.stack').append(this.model.get('chipStack'));
      return this.$('.bet').append(this.currentBet);
    };

    return ChipView;

  })(Backbone.View);

}).call(this);

/*
//@ sourceMappingURL=ChipView.map
*/
