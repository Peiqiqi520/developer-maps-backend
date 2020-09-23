#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Feature: Sample

    Background:
        Given I have deployed the business network definition ..
        And I have added the following participants of type org.example.biznet.SampleParticipant
            | participantId   | firstName | lastName |
            | alice@email.com | Alice     | A        |
            | bob@email.com   | Bob       | B        |
        And I have added the following assets of type org.example.biznet.SampleAsset
            | assetId | owner           | value |
            | 1       | alice@email.com | 10    |
            | 2       | bob@email.com   | 20    |
        And I have issued the participant org.example.biznet.SampleParticipant#alice@email.com with the identity alice1
        And I have issued the participant org.example.biznet.SampleParticipant#bob@email.com with the identity bob1

    Scenario: Alice can read all of the assets
        When I use the identity alice1
        Then I should have the following assets of type org.example.biznet.SampleAsset
            | assetId | owner           | value |
            | 1       | alice@email.com | 10    |
            | 2       | bob@email.com   | 20    |

    Scenario: Bob can read all of the assets
        When I use the identity alice1
        Then I should have the following assets of type org.example.biznet.SampleAsset
            | assetId | owner           | value |
            | 1       | alice@email.com | 10    |
            | 2       | bob@email.c