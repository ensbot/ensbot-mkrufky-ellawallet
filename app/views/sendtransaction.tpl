<!-- send transaction -->
<div class="tab-pane active" ng-if="globalService.currentTab==globalService.tabs.sendTransaction.id">
  <h2> Send Transaction </h2>
  <div>
    <wallet-decrypt-drtv></wallet-decrypt-drtv>
  </div>
  <section class="row" ng-show="wallet!=null" ng-controller='sendTxCtrl'>
    <hr />
    <div class="col-sm-4">
      <h4> Account Information </h4>
      <div>
        <div id="addressIdenticon" title="Address Indenticon" blockie-address="{{wallet.getAddressString()}}" watch-var="wallet"></div>
        <br />
        <p> Account Address:
          <br /> <strong style="margin-left: 1em" class="mono">{{wallet.getChecksumAddressString()}}</strong></p>
          <p> Account Balance:
          <br />
                <strong class="text-success" style="margin-left: 1em"> {{etherBalance}} Ether </strong>
                <br />
                <strong class="text-success" style="margin-left: 1em"> {{usdBalance}} USD </strong>
                <br />
                <strong class="text-success"  style="margin-left: 1em"> {{eurBalance}} EUR </strong>
                <br />
                <strong class="text-success" style="margin-left: 1em"> {{btcBalance}} BTC </strong>
        </p>
      </div>
      <br />
      <div class="well">
        <p> Don't have anyone to send a transaction to? You can always donate to us! Donations mean we spend more time creating new features, listening to your feedback, and giving you what you want.</p>
        <a class="btn btn-primary btn-block btnAction" func="donateButtonClick" id="btndonate">DONATE</a>
        <div class="text-success text-center marg-v-sm"><strong id="donateThanks" style="display: none;"> THANK YOU!!! </strong></div>
      </div>
    </div>
    <div class="col-sm-8">
      <h4>Send Transaction</h4>
      <div class="form-group col-xs-10">
        <label> To Address: </label>
        <input class="form-control"  type="text" placeholder="0x7cB57B5A97eAbe94205C07890BE4c1aD31E486A8" ng-model="toAddress" ng-change="validateAddress()"/>
        <div ng-bind-html="validateAddressStatus"></div>
      </div>
      <div class="col-xs-2 address-identicon-container">
        <div id="addressIdenticon" title="Address Indenticon" blockie-address="{{toAddress}}" watch-var="toAddress"></div>
      </div>
      <div class="form-group col-xs-12">
        <label>
          Amount to Send:
          <br />
        </label>
        <a class="btnAction pull-right" func="transferAllBalance" id="transferAllBalance">Transfer total available balance</a>
        <input class="form-control" type="text" placeholder="Amount" id="sendtxamount">
        <div class="radio">
          <label>
            <input type="radio" name="currencyRadio" checked value="ether">Ether</label>
          <label>
            <input type="radio" name="currencyRadio" value="finney">Finney</label>
          <label>
            <input type="radio" name="currencyRadio" value="szabo">Szabo</label>
          <div id="weiamount"></div>
        </div>
        <!-- advanced option panel -->
        <a><p class="strong"> + Advanced Options </p></a>
        <section>
          <div class="form-group">
            <label> Data: </label>
            <input class="form-control" type="text" placeholder="0x6d79657468657277616c6c65742e636f6d20697320746865206265737421" />
          </div>
          <div class="form-group">
            <label> Gas: </label>
            <input class="form-control" type="text" placeholder="21000" />
          </div>
        </section>
        <!-- / advanced option panel -->
      </div>
      <div class="form-group col-xs-12">
        <a class="btn btn-info btn-block btnAction" func="preCreateTransaction" id="btngeneratetranaction">GENERATE TRANSACTION</a>
      </div>
      <div class="col-xs-12">
        <p><small> * We use standard rates for all gas + a itty-bitty bit more to ensure it gets mined quickly. If you move 1 Ether the total transaction will be that 1 Ether + current gas price + 1 gwei in gas. We do not take a transaction fee.</small></p>
         <div id="txcreatestatus"></div>
      </div>
      <div class="form-group col-xs-12" style="display: none;" id="divtransactionTAs">
        <label> Raw Transaction </label>
        <textarea class="form-control" rows="4" disabled id="tarawtx"></textarea>
        <label> Signed Transaction </label>
        <textarea class="form-control" rows="4" disabled id="tasignedtx"></textarea>
      </div>
      <div class="form-group col-xs-12" id="divsendtranaction" style="display: none;">
        <a class="btn btn-primary btn-block" data-toggle="modal" data-target="#sendTransaction">SEND TRANSACTION</a>
      </div>
      <div id="txsendstatus"></div>
      <!-- Modal -->
      <div class="modal fade" id="sendTransaction" tabindex="-1" role="dialog" aria-labelledby="sendTransactionLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h3 class="modal-title" id="myModalLabel"> <strong class="text-danger">Warning!</strong></h3>
            </div>
            <div class="modal-body">
              <h4>
                You are about to send
                <strong id="confirmAmount" class="text-primary"> 345 </strong>
                <strong id="confirmCurrancy" class="text-primary"> Ether </strong>
                to address
                <strong id="confirmAddress" class="text-primary"> 928342938472938 </strong>
              </h4>
              <h4> Are you <span class="text-underline"> sure </span> you want to do this?</h4>
            </div>
            <div class="modal-footer text-center">
              <button type="button" class="btn btn-default" data-dismiss="modal">No, get me out of here!</button>
              <button type="button" class="btn btn-primary btnAction" func="preSendTransaction" id="btnapprovesend">Yes, I am sure! Make transaction.</button>
            </div>
          </div>
        </div>
      </div>
      <!--/modal-->
    </div>
  </section>
</div>
<!-- /send transaction -->