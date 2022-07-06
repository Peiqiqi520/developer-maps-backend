
/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use strict';
/**
 * Track the trade of a commodity from one trader to another
 * @param {org.example.biznet.Trade} trade - the trade to be processed
 * @transaction
 */
async function tradeAsset(trade) {
    trade.property.owner = trade.newOwner;
    let assetRegistry = await getAssetRegistry('org.example.biznet.Property');
    await assetRegistry.update(trade.property);
}
/**
 * Track the trade of a commodity from one trader to another
 * @param {org.example.biznet.Transfer} transfer - the trade to be processed
 * @transaction
 */
async function transferPackage(transfer) {
    // Update handler in package
    let packRegistry = await getAssetRegistry('org.example.biznet.Package');
    let pack = transfer.package;
    pack.handler = transfer.newHandler;
    await packRegistry.update(pack);
}

/**
 * Track the trade of a commodity from one trader to another
 * @param {org.example.biznet.CreatePackage} request - the trade to be processed
 * @transaction
 */
async function createPackage(request) {
    let factory = getFactory();

    // Create package
    let pack = factory.newResource('org.example.biznet', 'Package', request.packageId);
    pack.active = true;
    pack.created = request.timestamp;
    pack.handler = request.sender;
    pack.sender = request.sender;
    pack.recipient = request.recipient;
    pack.contents = request.contents;
    let packRegistry = await getAssetRegistry('org.example.biznet.Package');
    await packRegistry.add(pack);

    // Remove ownership from all properties
    let propRegistry = await getAssetRegistry('org.example.biznet.Property');
    let traderRegistry = await getParticipantRegistry('org.example.biznet.Trader');
    for(let i = 0; i < request.contents.length; i++) {
        let prop = request.contents[i];
        prop.owner = await traderRegistry.get('TRADERNULL');
        await propRegistry.update(prop);
    }
}
/**
 * Track the trade of a commodity from one trader to another
 * @param {org.example.biznet.UnboxPackage} request - the trade to be processed
 * @transaction
 */
async function unboxPackage(request) {
    // Deactivate package
    let packRegistry = await getAssetRegistry('org.example.biznet.Package');
    let pack = request.package;
    pack.active = false;
    await packRegistry.update(pack);
    
    // Update all properties to new owner
    let propRegistry = await getAssetRegistry('org.example.biznet.Property');