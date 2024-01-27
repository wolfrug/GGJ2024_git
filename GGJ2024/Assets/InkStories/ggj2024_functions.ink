// Functions file

LIST allRooms = RNone, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31, R32, R33, R34, R35, R36, R_First12, R_Second12, R_Third12, R_1to18, R_Even, R_Red, R_Black, R_Odd, R_19to36, R_TopRow, R_MiddleRow, R_BottomRow

LIST payOut = MaxPayout, DoublePayout, EvenPayout

VAR eliminatedRooms = ()

VAR rumourRoom = ()

VAR attemptsLeft = 4

VAR confidence = 100
VAR betConfidence = 0

===function SetRandomRumourRoom()===
~rumourRoom = (R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31, R32, R33, R34, R35, R36)
~rumourRoom = LIST_RANDOM(rumourRoom)

===function ContainsRumourRoom(room)
~return ContainedRooms(room)?rumourRoom

===function RoomPayout(room)===
~temp roomPayOut = MaxPayout
{LIST_COUNT(ContainedRooms(room))>12:
~roomPayOut = EvenPayout
- else:
{LIST_COUNT(ContainedRooms(room))>1:
~roomPayOut = DoublePayout
}
}
~return roomPayOut

===function EliminateRoomsIfGuaranteedEmpty(room)
{not (ContainsRumourRoom(room)):
~eliminatedRooms += ContainedRooms(room)
{room:
- R_Even:
~eliminatedRooms += R_Odd
- R_Odd:
~eliminatedRooms += R_Even
- R_Black:
~eliminatedRooms += R_Red
- R_Red:
~eliminatedRooms += R_Black
-R_1to18:
~eliminatedRooms += R_19to36
-R_19to36:
~eliminatedRooms += R_1to18
}
- else:
{room:
- R_Even: // if it IS in even, then it's not in odd & vice versa
~eliminatedRooms += ContainedRooms(R_Odd)
~eliminatedRooms += R_Odd
- R_Odd:
~eliminatedRooms += ContainedRooms(R_Even)
~eliminatedRooms += R_Even
- R_Black: // same for black/red
~eliminatedRooms += ContainedRooms(R_Red)
~eliminatedRooms += R_Red
- R_Red:
~eliminatedRooms += ContainedRooms(R_Black)
~eliminatedRooms += R_Black
- R_1to18: // and for 1-18 and 19-36
~eliminatedRooms += ContainedRooms(R_19to36)
~eliminatedRooms += R_19to36
- R_19to36:
~eliminatedRooms += ContainedRooms(R_1to18)
~eliminatedRooms += R_1to18
- R_First12: // if it's in the first 12, its not in the other two
~eliminatedRooms += ContainedRooms(R_Second12)
~eliminatedRooms += ContainedRooms(R_Third12)
~eliminatedRooms += (R_Second12, R_Third12)
- R_Second12:
~eliminatedRooms += ContainedRooms(R_First12)
~eliminatedRooms += ContainedRooms(R_Third12)
~eliminatedRooms += (R_First12, R_Third12)
- R_Third12:
~eliminatedRooms += ContainedRooms(R_First12)
~eliminatedRooms += ContainedRooms(R_Second12)
~eliminatedRooms += (R_First12, R_Second12)
- R_TopRow: // if it's in the top row, it's not in row 2 or 3
~eliminatedRooms += ContainedRooms(R_MiddleRow)
~eliminatedRooms += ContainedRooms(R_BottomRow)
~eliminatedRooms += (R_MiddleRow, R_BottomRow)
- R_MiddleRow:
~eliminatedRooms += ContainedRooms(R_TopRow)
~eliminatedRooms += ContainedRooms(R_BottomRow)
~eliminatedRooms += (R_TopRow, R_BottomRow)
- R_BottomRow:
~eliminatedRooms += ContainedRooms(R_TopRow)
~eliminatedRooms += ContainedRooms(R_MiddleRow)
~eliminatedRooms += (R_TopRow, R_MiddleRow)
}
}
// We always add the selected room too, because, duh (unless it's correct)
{room!=rumourRoom:
~eliminatedRooms+=room
}
// And lastly, we check the 12-rooms to see if they can be removed
{EliminateGuaranteedSuccessGatherRooms()}

===function EliminateGuaranteedSuccessGatherRooms()
{eliminatedRooms?ContainedRooms(R_First12):
~eliminatedRooms+=R_First12
}
{eliminatedRooms?ContainedRooms(R_Second12):
~eliminatedRooms+=R_Second12
}
{eliminatedRooms?ContainedRooms(R_Third12):
~eliminatedRooms+=R_Third12
}
{eliminatedRooms?ContainedRooms(R_TopRow):
~eliminatedRooms+=R_TopRow
}
{eliminatedRooms?ContainedRooms(R_MiddleRow):
~eliminatedRooms+=R_MiddleRow
}
{eliminatedRooms?ContainedRooms(R_BottomRow):
~eliminatedRooms+=R_BottomRow
}
{eliminatedRooms?ContainedRooms(R_Red):
~eliminatedRooms+=R_Red
}
{eliminatedRooms?ContainedRooms(R_Black):
~eliminatedRooms+=R_Black
}
{eliminatedRooms?ContainedRooms(R_Odd):
~eliminatedRooms+=R_Odd
}
{eliminatedRooms?ContainedRooms(R_Even):
~eliminatedRooms+=R_Even
}
{eliminatedRooms?ContainedRooms(R_1to18):
~eliminatedRooms+=R_1to18
}
{eliminatedRooms?ContainedRooms(R_19to36):
~eliminatedRooms+=R_19to36
}
// If the other two are already in, the third is guaranteed not to be a thing
{LIST_COUNT(eliminatedRooms^(R_First12, R_Second12, R_Third12))>1:
~eliminatedRooms+=(R_First12, R_Second12, R_Third12)
}
// If the other two are already in, the third is guaranteed not to be a thing
{LIST_COUNT(eliminatedRooms^(R_TopRow, R_MiddleRow, R_BottomRow))>1:
~eliminatedRooms+=(R_TopRow, R_MiddleRow, R_BottomRow)
}

===function BonusRoomEliminationOnCorrectGuess()===
~temp remainingRooms = (R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31, R32, R33, R34, R35, R36) - eliminatedRooms
~remainingRooms -= rumourRoom
~temp randomRoomToEliminate = LIST_RANDOM(remainingRooms)
~eliminatedRooms += randomRoomToEliminate
~return randomRoomToEliminate

===function EliminateAllGatherRooms()===
~eliminatedRooms+=(R_First12, R_Second12, R_Third12, R_1to18, R_Even, R_Red, R_Black, R_Odd, R_19to36, R_TopRow, R_MiddleRow, R_BottomRow)

===function GetPayout(room)
~temp pay = 0
{ContainsRumourRoom(room):
{RoomPayout(room):
- EvenPayout:
~pay = betConfidence + betConfidence
- DoublePayout:
~pay = betConfidence + (betConfidence * 2)
- MaxPayout:
~temp remainingRooms = (R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31, R32, R33, R34, R35, R36) - eliminatedRooms
~pay = betConfidence + (betConfidence * LIST_COUNT(remainingRooms))
}
~confidence += pay
}
~pay -= betConfidence
~betConfidence = 0
~return pay

===function ContainedRooms(room)===
~temp roomsContained = room
{room:
-R_First12:
~roomsContained = (R3, R6, R9, R12, R2, R5, R8, R11, R1, R4, R7, R10)
- R_Second12:
~roomsContained = (R15, R18, R21, R24, R14, R17, R20, R23, R13, R16, R19, R22)
- R_Third12:
~roomsContained = (R27, R30, R33, R36, R26, R29, R32, R35, R25, R28, R31, R34)
- R_TopRow:
~roomsContained = (R3, R6, R9, R12, R15, R18, R21, R24, R27, R30, R33, R36)
- R_MiddleRow:
~roomsContained = (R2, R5, R8, R11, R14, R17, R20, R23, R26, R29, R32, R35)
- R_BottomRow:
~roomsContained = (R1, R4, R7, R10, R13, R16, R19, R22, R25, R28, R31, R34)
- R_1to18:
~roomsContained = (R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18)
- R_19to36:
~roomsContained = (R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31, R32, R33, R34, R35, R36)
-R_Even:
~roomsContained = (R2, R4, R6, R8, R10, R12, R14, R16, R18, R20, R22, R24, R26, R28, R30, R32, R34, R36)
-R_Odd:
~roomsContained = (R1, R3, R5, R7, R9, R11, R13, R15, R17, R19, R21, R23, R25, R27, R29, R31, R33, R35)
-R_Red:
~roomsContained = (R1, R3, R5, R7, R9, R12, R14, R16, R18, R19, R21, R23, R25, R27, R30, R32, R34, R36)
-R_Black:
~roomsContained = (R2, R4, R6, R8, R10, R11, R13, R15, R17, R20, R22, R24, R26, R28, R29, R31, R33, R35)
}
~return roomsContained

===function SelectRoom(room)===
CustomButton({room})


===AdjustBet(->returnLocation)
[Confidence left: {confidence}, Confidence bet: {betConfidence}]
+ {confidence >=10} [Increase bet by 10.]
~betConfidence += 10
~confidence -= 10
+ {betConfidence>=10} [Decrease bet by 10.]
~betConfidence-=10
~confidence+=10
+ {betConfidence>0} [Clear bets.]
~confidence+=betConfidence
~betConfidence = 0

- ->returnLocation


===GoToRoom(->continuePoint)
//Use: ->GoToRoom(->continuePoint)
//=continuePoint(itemChosen)
~temp selectedItem = ()
~temp copyList = LIST_MIN(LIST_ALL(allRooms))
<-loop(continuePoint, copyList)

+ [{SelectRoom("RNone")} Cancel]
~selectedItem = RNone
->continuePoint(selectedItem)

=loop(->continuePoint, copyList)
{LIST_VALUE(copyList) != LIST_VALUE(LIST_MAX(LIST_ALL(allRooms))):
~copyList++
<-addRoom(copyList, continuePoint)
->loop(continuePoint, copyList)
}

=addRoom(targetRoom, ->continuePoint)
+ {not (eliminatedRooms?targetRoom)} [{SelectRoom(targetRoom)} {targetRoom}!]
->continuePoint(targetRoom)